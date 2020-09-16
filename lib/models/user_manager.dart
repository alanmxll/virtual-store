import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../helpers/firebase_errors.dart';
import '../models/user.dart' as user_model;

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({
    user_model.User user,
    Function onFail,
    Function onSuccess,
  }) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print('FIREBASEAUTHEXCEPTION ERROR -> $e');
      onFail(getErrorString(e.code));
    } catch (e) {
      print('ERROR -> $e');
    }
  }
}
