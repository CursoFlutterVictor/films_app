import 'package:films_app/controllers/search_controller.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return Row(children: const [
    //   Icon(
    //     Icons.search,
    //     color: Colors.white,
    //   ),
    //   SizedBox(
    //     width: 5,
    //   ),
    //   Text(
    //     "Search",
    //     style: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    // ]);

    final searhBarController = SearchBarController();

    return Row(children: [
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
          onSubmitted: (String value) {
            print(value);
            searhBarController.searchFieldController.clear();
            searhBarController.searchFieldController.text = "HOLA";
          },
        ),
      ),
      const Icon(
        Icons.close,
        color: Colors.white,
      ),
    ]);
  }
}
