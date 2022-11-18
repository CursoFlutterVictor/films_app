import 'package:films_app/controllers/wrapped_list_controller.dart';
import 'package:films_app/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrappedMoviesWidget extends StatelessWidget {
  const WrappedMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WrappedListController wrappedListController = Get.find();

    return Obx(() {
      List<Widget> movies = [];

      if (wrappedListController.wrappedMovieList.value!.results != null) {
        for (var element
            in wrappedListController.wrappedMovieList.value!.results!) {
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
