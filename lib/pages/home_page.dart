import 'package:flutter/material.dart';
import 'package:films_app/pages/sections/home_upper_search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Flexible(
            flex: 3,
            child: HomeUpperSearchWidget(
              textMessage: "Hello, what do you want to watch ?",
            )),
        Flexible(
          flex: 6,
          child: Container(color: const Color.fromRGBO(44, 57, 63, 1)),
        )
      ]),
    );
  }
}
