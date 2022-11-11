import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  Future<User?> signInAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();

      //print(userCredential);
      print("Signed in with temporary account.");

      User? user = userCredential.user!;
      print(user.isAnonymous);

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
    return null;
  }
}
