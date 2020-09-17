import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String confirmPassword;

  User({this.email, this.password, this.name, this.id});

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
