import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/services/movies_service.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MovieListController extends GetxController {
  final Rx<MovieList?> popularMovieList = MovieList().obs;
  final Rx<MovieList?> topRatedMovieList = MovieList().obs;
  final Rx<MovieList?> upcomingMovieList = MovieList().obs;
  RxBool popularListLoaded = false.obs;
  RxBool topRatedListLoaded = false.obs;
  RxBool upcomingListLoaded = false.obs;

  MovieResult? selectedMovie;

  Future<void> fillPopularList() async {
    if (!popularListLoaded.value) {
      MovieList? list = await ServiceGetMovies.getPopularMovies(page: 1);
      popularMovieList.value = list;
      popularListLoaded.value = true;
    }
  }

  Future<void> fillTopRatedList() async {
    if (!topRatedListLoaded.value) {
      MovieList? list = await ServiceGetMovies.getTopRatedMovies(page: 1);
      topRatedMovieList.value = list;
      topRatedListLoaded.value = true;
    }
  }

  Future<void> fillUpcomingList() async {
    if (!upcomingListLoaded.value) {
      MovieList? list = await ServiceGetMovies.getUpcomingMovies(page: 1);
      upcomingMovieList.value = list;
      upcomingListLoaded.value = true;
    }
  }

  // final Rx<MovieList?> searchMovieList = MovieList().obs;
  // RxBool searchLoaded = false.obs;

  // Future<void> fillSearchList({String? query}) async {
  //   MovieList? list =
  //       await ServiceGetMovies.searchMovies(query: query, page: 1);
  //   if (list != null) {
  //     searchMovieList.value = list;
  //     searchLoaded.value = true;
  //   } else {
  //     searchLoaded.value = false;
  //   }
  // }
}
