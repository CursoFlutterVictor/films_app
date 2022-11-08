import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int filledStars = rating.toInt() ~/ 2;
    int emptyStars = 5 - filledStars;
    bool halfStar = rating % 2 >= 1 ? true : false;

    List<Widget> starsRow = [];

    // Cantidad de estrellas completas
    for (int i = 0; i < filledStars; i++) {
      starsRow.add(
        const Flexible(
          child: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      );
    }

    // Si hay estrellas parciales o vacias las pintamos
    if (emptyStars > 0) {
      for (int i = 0; i < emptyStars; i++) {
        // Si hay una media estrella la incluimos. Las siguientes son vacias
        if (halfStar) {
          starsRow.add(
            const Flexible(
              child: Icon(
                Icons.star_half,
                color: Colors.yellow,
              ),
            ),
          );
          halfStar = false;
        } else {
          starsRow.add(
            const Flexible(
              child: Icon(
                Icons.star_border,
                color: Colors.yellow,
              ),
            ),
          );
        }
      }
    }

    return Row(
      children: starsRow,
    );
  }
}
