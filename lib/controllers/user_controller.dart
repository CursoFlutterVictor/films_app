import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/models/user_data_model.dart';
import 'package:films_app/services/firestore_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  AuthController authController = Get.find();

  bool movieIsFavourite(String id) {
    UserData? user = authController.firestoreUser.value;
    if (user != null) {
      if (user.favMovies?.contains(id) ?? false) {
        return true;
      }
    }
    return false;
  }

  void toggleFavouriteMovie(String id) {
    UserData? user = authController.firestoreUser.value;

    if (user != null) {
      user.favMovies ??= [];
      if (user.favMovies?.contains(id) == false) {
        user.favMovies?.add(id);
      } else {
        user.favMovies?.remove(id);
      }

      FirestoreDataBase().updateUser(user: user);

      // Fuerzo el refresco para ver el cambio en el icono de pantalla
      authController.firestoreUser.refresh();
    }
  }
}
