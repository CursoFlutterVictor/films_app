import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/services/movies_service.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MovieListController extends GetxController {
  final Rx<MovieList?> movieList = MovieList().obs;
  RxBool listLoaded = false.obs;
  MovieResult? selectedMovie;

  Future<void> fillPopularList() async {
    MovieList? list = await ServiceGetMovies.getPopularMovies(page: 1);
    movieList.value = list;
    listLoaded.value = true;
  }

  final Rx<MovieList?> searchMovieList = MovieList().obs;
  RxBool searchLoaded = false.obs;

  Future<void> fillSearchList({String? query}) async {
    MovieList? list =
        await ServiceGetMovies.searchMovies(query: query, page: 1);
    if (list != null) {
      searchMovieList.value = list;
      searchLoaded.value = true;
    } else {
      searchLoaded.value = false;
    }
  }
}
