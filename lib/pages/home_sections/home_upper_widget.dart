import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUpperWidget extends StatelessWidget {
  final String textMessage;
  const HomeUpperWidget({Key? key, required this.textMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
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
              FloatingActionButton(
                onPressed: () {
                  authController.signOut();
                },
              ),
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
                child: const SearchBarWidget(),
              )
            ]),
      ),
    );
  }
}
