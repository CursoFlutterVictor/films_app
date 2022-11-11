import 'package:films_app/routes/app_routes.dart';
import 'package:films_app/services/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatiPasswordController = TextEditingController();
  Rxn<User> firebaseUser = Rxn<User>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get user => _auth.authStateChanges();

  loginAnonymous() async {
    //firebaseUser.value = await AuthFirebase().signInAnonymous();
    final user = await AuthFirebase().signInAnonymous();
    print(user);
  }

  registerWithEmailPass(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential);
  }

  loginWithEmailPass(String email, String password) async {
    final userCredential =
        await AuthFirebase().signInWithEmailAndPassword(email, password);
    print(userCredential);
  }

  Future<void> signOut() async {
    print("Sign out...");
    return _auth.signOut();
  }

  @override
  void onReady() {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  // Cuando cambia el usuario logado comprobamos
  handleAuthChanged(User? firebaseUser) async {
    if (firebaseUser?.isAnonymous ?? false) {
      print("Entrando");
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      if (firebaseUser == null) {
        print("Saliendo");
        Get.offAllNamed(AppRoutes.LOGIN);
      } else {
        print("Entrando");
        Get.offAllNamed(AppRoutes.HOME);
      }
    }
  }
}
