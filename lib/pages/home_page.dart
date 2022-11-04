import 'package:flutter/material.dart';
import 'package:films_app/pages/sections/home_upper_search_widget.dart';
import 'package:films_app/pages/sections/home_bottom_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(91, 161, 210, 1),
      body: Column(children: [
        Flexible(
            flex: 3,
            child: HomeUpperSearchWidget(
              textMessage: "Hello, what do you want to watch ?",
            )),
        Flexible(flex: 6, child: HomeBottomWidget())
      ]),
    );
  }
}
