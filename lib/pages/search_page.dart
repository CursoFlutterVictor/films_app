import 'package:films_app/controllers/search_controller.dart';
import 'package:films_app/widgets/wraped_movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBarController searchBarController = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 57, 63, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.green,
              margin: const EdgeInsets.only(
                top: 25,
                left: 10,
                right: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      searchBarController.searchFieldController.clear();
                      Get.back();
                    },
                  ),
                  const Text(
                    "SEARCH RESULTS",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const WrapedMoviesWidget(),
          ],
        ),
      ),
    );
  }
}
