String getErrorString(String code) {
  switch (code) {
    case 'weak-password':
      return 'Your password is too weak.';
    case 'invalid-email':
      return 'Your email is invalid.';
    case 'email-already-in-use':
      return 'E-mail is already being used in another account.';
    case 'invalid-credential':
      return 'Your email is invalid.';
    case 'wrong-password':
      return 'Your password is incorrect.';
    case 'user-not-found':
      return 'There is no user with this email.';
    case 'user-disabled':
      return 'This user has been disabled.';
    case 'too-many-requests':
      return 'Too many requests. Try again later.';
    case 'operation-not-allowed':
      return 'Operation not allowed.';

    default:
      return 'An undefined error has occurred.';
  }
}
