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
    MovieResult movie = movieListController.selectedMovie!;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 57, 63, 1),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 450,
                child: Stack(
                  children: [
                    Image.network(
                      urlImage(movie.posterPath!),
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle!,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.overview!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
