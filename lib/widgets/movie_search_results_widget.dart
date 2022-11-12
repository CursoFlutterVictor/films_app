import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieSearchResultsWidget extends StatelessWidget {
  const MovieSearchResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String displayText = "SEARCH RESULTS";

    return GetBuilder<MovieListController>(
        init: MovieListController(),
        builder: (controller) {
          // Retorno del widget
          return Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: double.infinity,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //"RECOMMENDED FOR YOU",
                          displayText,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const TextButton(
                          onPressed: null,
                          child: Text(
                            "Show More",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Obx(() {
                    MovieList paintList = controller.searchMovieList.value!;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: paintList.results?.length ?? 0,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            right: 0.0,
                          ),
                          child: MovieItemWidget(
                            movie: paintList.results![index],
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ],
            ),
          );
        });
  }
}
