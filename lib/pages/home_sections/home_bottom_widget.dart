import 'package:films_app/utils/movie_list_type_emum.dart';
import 'package:films_app/widgets/movie_list_widget.dart';
import 'package:flutter/material.dart';

class HomeBottomWidget extends StatelessWidget {
  const HomeBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(44, 57, 63, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MovieListWidget(type: MovieListType.mostPopulars),
              MovieListWidget(type: MovieListType.topRated),
              MovieListWidget(type: MovieListType.upcoming),
            ],
          ),
        ),
      ),
    );
  }
}

// class MovieResultSection extends StatelessWidget {
//   const MovieResultSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MovieListController movieListController = Get.find();
//     List<Widget> widgets = [];

//     return Obx(() {
//       if (movieListController.searchMode.value) {
//         widgets.clear();
//         widgets.add(const MovieSearchResultsWidget());
//       } else {
//         widgets.clear();
//         widgets.add(const MovieListWidget(type: MovieListType.mostPopulars));
//         widgets.add(const MovieListWidget(type: MovieListType.topRated));
//         widgets.add(const MovieListWidget(type: MovieListType.upcoming));
//       }
//       return Wrap(
//         children: widgets,
//       );
//     });
//   }
// }
