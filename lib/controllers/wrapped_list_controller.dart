import 'package:films_app/models/movie_list_model.dart';
import 'package:get/get.dart';

class WrappedListController extends GetxController {
  final Rx<MovieList?> wrappedMovieList = MovieList().obs;
}
