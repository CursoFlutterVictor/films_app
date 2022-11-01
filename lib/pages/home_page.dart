import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: Text("hola"),
            height: 300,
          ))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text("adios"),
            height: 300,
          ))
        ])
      ],
    ));
  }
}
