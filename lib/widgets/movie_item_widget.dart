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
    return SizedBox(
      width: 120,
      height: 300,
      child: Card(
          elevation: 0,
          color: Colors.transparent,
          //color: Colors.green,
          child: Column(children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.network(
                  src,
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 3,
                ),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
