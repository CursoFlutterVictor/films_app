import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/controllers/user_controller.dart';
import 'package:films_app/models/movie_list_model.dart';
import 'package:films_app/utils/url_utils.dart';
import 'package:films_app/widgets/appbar_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    UserController userController = Get.find();
    MovieResult movie = movieListController.selectedMovie.value!;

    Image? img;

    if (movie.posterPath == null) {
      img = Image.asset(
        "assets/nocover.jpg",
        fit: BoxFit.fill,
        width: double.infinity,
      );
    } else {
      img = Image.network(
        urlImage(movie.posterPath!),
        fit: BoxFit.fill,
        width: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/nocover.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
          );
        },
      );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40.0), // here the desired height
        child: AppBarUserWidget(),
      ),
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
                    img,
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
                          Obx(() {
                            bool isFav = userController
                                .movieIsFavourite(movie.id.toString());

                            return IconButton(
                              icon: Icon(
                                isFav
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border,
                                color: isFav ? Colors.pink : Colors.white,
                              ),
                              onPressed: () {
                                userController
                                    .toggleFavouriteMovie(movie.id.toString());
                              },
                            );
                          }),
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
