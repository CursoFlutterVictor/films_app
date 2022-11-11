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

  signInAnonymous() async {
    firebaseUser.value = await AuthFirebase().signInAnonymous();
    print(firebaseUser.value?.isAnonymous ?? "");
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
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}
