import 'package:flutter/material.dart';

class HomeUpperSearchWidget extends StatelessWidget {
  final String textMessage;
  const HomeUpperSearchWidget({Key? key, required this.textMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(91, 161, 210, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textMessage,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(143, 189, 226, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(children: const [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  // TODO: Esto debe ser un input text
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              )
            ]),
      ),
    );
  }
}
