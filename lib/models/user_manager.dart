import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helpers/firebase_errors.dart';
import '../models/user.dart' as user_model;

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;

  bool get loading => _loading;

  void setLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  Future<void> signIn({
    user_model.User user,
    Function onFail,
    Function onSuccess,
  }) async {
    setLoading();
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading();
  }
}
