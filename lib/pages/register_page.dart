import 'package:films_app/services/auth_firebase.dart';
import 'package:films_app/widgets/register_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                AuthFirebase().signInAnonymous();
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
