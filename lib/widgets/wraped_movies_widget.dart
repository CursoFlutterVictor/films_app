import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrapedMoviesWidget extends StatelessWidget {
  const WrapedMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    List<Widget> movies = [];

    return Obx(() {
      if (movieListController.searchMovieList.value!.results != null) {
        for (var element
            in movieListController.searchMovieList.value!.results!) {
          movies.add(
            MovieItemWidget(
              movie: element,
            ),
          );
        }
      }

      return Wrap(
        children: movies,
      );
    });
  }
}
