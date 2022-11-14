import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:films_app/models/user_data_model.dart';

class FirestoreDataBase {
  final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
  static String collection = "USERS";

  // Recibe la informacion del firebaseUser y escribe informacion adicional
  // en la coleccion USERS
  Future<bool> createNewUser({
    required String uid,
    String? name,
    required String email,
  }) async {
    try {
      await firestoreDB.collection(collection).doc(uid).set({
        "uid": uid,
        "name": name,
        "email": email,
        "isAdmin": false,
      });

      return true;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UserData?> getUserData({required String uid}) async {
    try {
      DocumentSnapshot doc =
          await firestoreDB.collection(collection).doc(uid).get();

      print(doc.data());

      return UserData.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
