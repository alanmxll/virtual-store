import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/validators.dart';
import '../../models/user.dart';
import '../../models/user_manager.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Full name',
                      ),
                      enabled: !userManager.loading,
                      validator: (name) {
                        if (name.isEmpty) {
                          return 'Required Field';
                        } else if (name.trim().split(' ').length <= 1) {
                          return 'Fill in your full name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) => user.name = name,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                      ),
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email.isEmpty) {
                          return 'Required Field';
                        } else if (!emailValid(email)) {
                          return 'Invalid E-mail';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      enabled: !userManager.loading,
                      validator: (password) {
                        if (password.isEmpty) {
                          return 'Required Field';
                        } else if (password.length < 6) {
                          return 'Weak password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      onSaved: (password) => user.password = password,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Repeat Password',
                      ),
                      enabled: !userManager.loading,
                      validator: (password) {
                        if (password.isEmpty) {
                          return 'Required Field';
                        } else if (password.length < 6) {
                          return 'Weak password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      onSaved: (password) => user.confirmPassword = password,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      height: 44.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          overlayColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100);
                              }
                              return null;
                            },
                          ),
                        ),
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();

                                  if (user.password != user.confirmPassword) {
                                    scaffoldKey.currentState.showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Passwords do not match!',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  userManager.signUp(
                                    user: user,
                                    onSuccess: () {
                                      Navigator.pop(context);
                                    },
                                    onFail: (e) {
                                      scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Sign Up failed: $e',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
