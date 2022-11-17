import 'package:films_app/widgets/appbar_user_widget.dart';
import 'package:films_app/widgets/wrapped_movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WrappedListPage extends StatelessWidget {
  const WrappedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40.0), // here the desired height
        child: AppBarUserWidget(),
      ),
      backgroundColor: const Color.fromRGBO(44, 57, 63, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                      Get.back();
                    },
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const WrappedMoviesWidget(),
          ],
        ),
      ),
    );
  }
}
