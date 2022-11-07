import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/utils/url_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    MovieResult? movie = movieListController.selectedMovie;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Image.network(urlImage(movie!.posterPath!)),
          ),
          Flexible(
            child: Text(movie.title!),
          )
        ],
      ),
    );
  }
}
