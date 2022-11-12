import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  Future<User?> loginAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();

      User? user = userCredential.user!;

      //print("Signed in with temporary account.");

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      //print("Signed in with user ${user!.email}");

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          throw ("User not found");
        case "operation-not-allowed":
          throw ("Anonymous auth hasn't been enabled for this project.");
        case "wrong-password":
          throw ("Wrong Password");
        default:
          throw ("Login Error");
      }
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      //print("User registered ${user!.email}");

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    //print("Sign out...");
    return FirebaseAuth.instance.signOut();
  }
}
