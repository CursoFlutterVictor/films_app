import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:films_app/pages/home_sections/home_upper_widget.dart';
import 'package:films_app/pages/home_sections/home_bottom_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MovieListController>(() => MovieListController());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(91, 161, 210, 1),
      body: Column(children: const [
        Flexible(
            flex: 1,
            child: HomeUpperWidget(
              textMessage: "Hello, what do you want to watch ?",
            )),
        Flexible(
          flex: 2,
          child: HomeBottomWidget(),
        )
      ]),
    );
  }
}
