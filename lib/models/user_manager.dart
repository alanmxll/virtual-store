import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart' as user_model;

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(user_model.User user) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      debugPrint('UID -> ${result.user.uid}');
    } on PlatformException catch (e) {
      debugPrint('ERROR -> $e');
    }
  }
}
