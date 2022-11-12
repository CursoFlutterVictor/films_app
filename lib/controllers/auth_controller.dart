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

  // Este es el usuario que hay autenticado
  Rxn<User> firebaseUser = Rxn<User>();

  // Este stream escucha los cambios de estado en la autenticacion
  Stream<User?> get userStream => FirebaseAuth.instance.authStateChanges();

  // Configura el listener y la funcion callback
  @override
  void onReady() {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(userStream);
    super.onReady();
  }

  // Callback que maneja los cambios en el usuario actual y redirige a
  // la pagina correspondiente de la app.
  void handleAuthChanged(User? firebaseUser) async {
    if (firebaseUser?.isAnonymous ?? false) {
      //print("Entrando");
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      if (firebaseUser == null) {
        //print("Saliendo");
        Get.offAllNamed(AppRoutes.LOGIN);
      } else {
        //print("Entrando");
        Get.offAllNamed(AppRoutes.HOME);
      }
    }
  }

  Future<String?> loginAnonymous() async {
    //firebaseUser.value = await AuthFirebase().signInAnonymous();
    String? returnMessage;
    try {
      firebaseUser.value = await AuthFirebase().loginAnonymous();
    } catch (e) {
      returnMessage = e.toString();
    }
    return returnMessage;
  }

  Future<String?> registerWithEmailPassword(
      String email, String password) async {
    String? returnMessage;

    try {
      firebaseUser.value = await AuthFirebase().registerWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      returnMessage = e.toString();
    }
    return returnMessage;
  }

  Future<String?> signInWithEmailPassword(String email, String password) async {
    String? returnMessage;
    try {
      firebaseUser.value = await AuthFirebase().signInWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      returnMessage = e.toString();
    }
    return returnMessage;
  }

  Future<void> signOut() async {
    AuthFirebase().signOut();
  }
}
