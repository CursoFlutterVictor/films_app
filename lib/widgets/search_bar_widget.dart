import 'package:films_app/controllers/movie_list_controller.dart';
import 'package:films_app/controllers/search_controller.dart';
import 'package:films_app/controllers/wrapped_list_controller.dart';
import 'package:films_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieListController movieListController = Get.find();
    WrappedListController wrappedListController = Get.find();
    SearchBarController searhBarController = SearchBarController();

    return Row(
      children: [
        const Icon(
          Icons.search,
          color: Colors.white,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Search",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.only(
                bottom: 11,
              ),
            ),
            controller: searhBarController.searchFieldController,
            onSubmitted: (String value) async {
              await movieListController.fillSearchList(query: value);
              wrappedListController.wrappedMovieList.value =
                  movieListController.searchMovieList.value;
              Get.toNamed(AppRoutes.WRAPPEDLIST, arguments: "SEARCH RESULTS");
            },
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          padding: EdgeInsets.zero,
          color: Colors.white,
          onPressed: () {
            searhBarController.searchFieldController.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        )
      ],
    );
  }
}
