import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/controllers/wrapped_list_controller.dart';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/models/user_data_model.dart';
import 'package:films_app/services/firestore_service.dart';
import 'package:films_app/services/movies_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  AuthController authController = Get.find();
  WrappedListController wrappedListController = Get.find();

  Rx<MovieList?> favMovies = MovieList().obs;
  RxBool isFavLoaded = false.obs;

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

  Future<void> fillFavouriteMovies() async {
    // if (isFavLoaded.value == false) {
    UserData? user = authController.firestoreUser.value;

    if (user != null && user.favMovies!.isNotEmpty) {
      MovieList? list =
          await ServiceGetMovies.getMovieListbyIDs(idList: user.favMovies!);
      if (list != null) {
        favMovies.value = list;
        isFavLoaded.value = true;
      } else {
        isFavLoaded.value = false;
      }
    }
    // }
  }
}
