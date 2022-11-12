import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/utils/show_dialog.dart';
import 'package:films_app/widgets/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            // FloatingActionButton(
            //   onPressed: () async {
            //     final error = await authController.loginAnonymous();
            //     if (error != null) {
            //       showMaterialDialog("Error", error);
            //     }
            //   },
            // ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "¡BIENVENIDO!",
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
              child: CardLoginForm(),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   children: const [
            //     Text("If you are not registered "),
            //     TextButton(
            //       onPressed: null,
            //       child: Text("click here"),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
