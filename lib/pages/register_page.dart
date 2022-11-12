import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/utils/show_dialog.dart';
import 'package:films_app/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () async {
                final error = await authController.loginAnonymous();
                if (error != null) {
                  showMaterialDialog("Error", error);
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "REGISTRATE!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: CardRegisterForm(),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
