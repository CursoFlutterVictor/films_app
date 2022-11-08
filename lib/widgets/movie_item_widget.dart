import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/utils/url_utils.dart';
import 'package:films_app/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieResult movie;

  const MovieItemWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    return GestureDetector(
      onTap: () {
        movieListController.selectedMovie = movie;
        Get.toNamed("/DETAIL");
      },
      child: SizedBox(
        width: 120,
        height: 300,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          //color: Colors.green,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.network(
                    urlImage(movie.posterPath!),
                    width: 200,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 3,
                  ),
                  child: Text(
                    movie.voteAverage.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // TODO: Redimentsionar row para evitar overflow
              RatingWidget(
                rating: movie.voteAverage!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
