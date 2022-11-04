import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/utils/url_utils.dart';
import 'package:films_app/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieListController>(
        init: MovieListController(),
        builder: (controller) {
          // Llamada al servicio
          controller.fillPopularList();
          // Retorno del widget
          return Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            height: 400,
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
                      children: const [
                        Text(
                          "RECOMMENDED FOR YOU",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Text("Show More"),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Obx(
                            () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.pupularMovieList.value!
                                      .results?.length ??
                                  0,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: MovieItemWidget(
                                    title: controller.pupularMovieList.value!
                                            .results![index].originalTitle ??
                                        '',
                                    src: urlImage(controller.pupularMovieList
                                        .value!.results![index].posterPath!),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
