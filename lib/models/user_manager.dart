import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helpers/firebase_errors.dart';
import '../models/user.dart' as user_model;

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  User user;

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signIn({
    user_model.User user,
    Function onFail,
    Function onSuccess,
  }) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      this.user = result.user;

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  void _loadCurrentUser() {
    final User currentUser = auth.currentUser;

    if (currentUser != null) {
      user = currentUser;
      print('UID -> ${user.uid}');
    }
    notifyListeners();
  }
}
