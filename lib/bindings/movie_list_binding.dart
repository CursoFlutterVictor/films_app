import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/controllers/user_controller.dart';
import 'package:get/get.dart';

// Una clase Binding por cada Controlador
class MovieListBinding extends Bindings {
  // Inyectamos las dependencias del controlador que va a ser lazy
  @override
  void dependencies() {
    Get.lazyPut<MovieListController>(() => MovieListController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
