import 'package:films_app/controllers/auth_controller.dart';
import 'package:films_app/utils/show_dialog.dart';
import 'package:films_app/utils/validators_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardLoginForm extends StatelessWidget {
  CardLoginForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    FormValidator formValidator = FormValidator();

    return Form(
      key: _formKey,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //POSIBLE ERROR
              //Es necesario utilizar los widget de Flutter como hijos del Form
              //Form => TextFormField , TextFormField ... etc => Validate
              //para hacer las validaciones => TextFormField
              // Flexible(
              //   child: TextFormField(
              //     obscureText: false,
              //     controller: authController.nameController,
              //     validator: formValidator.isValidName,
              //     decoration:
              //         const InputDecoration(hintText: "Escribe tu nombre"),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: false,
                  controller: authController.emailController,
                  validator: formValidator.isValidEmail,
                  decoration:
                      const InputDecoration(hintText: "Escribe tu email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: TextFormField(
                  obscureText: true,
                  controller: authController.passwordController,
                  validator: formValidator.isValidPass,
                  decoration:
                      const InputDecoration(hintText: "Escribe tu contrase??a"),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final error = await authController.signInWithEmailPassword(
                        authController.emailController.text,
                        authController.passwordController.text);
                    if (error != null) {
                      showMaterialDialog("Error", error);
                    }
                  }
                },
                child: Container(
                  height: 30,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    const Text("If you are not registered"),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed("/REGISTER");
                      },
                      child: const Text(
                        "click here",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 102, 204, 1.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
