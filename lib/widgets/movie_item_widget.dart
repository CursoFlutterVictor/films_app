import 'package:flutter/material.dart';

class MovieItemWidget extends StatelessWidget {
  final String title;
  final String src;

  const MovieItemWidget({
    Key? key,
    required this.title,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Column(
        children: [
          Image.network(
            src,
            width: 50,
            height: 50,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
