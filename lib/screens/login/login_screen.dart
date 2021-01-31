import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/validators.dart';
import '../../models/user.dart';
import '../../models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                '/signup',
              );
            },
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, ___) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                      ),
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (!emailValid(email)) {
                          return 'Invalid E-mail';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16.9,
                    ),
                    TextFormField(
                      autocorrect: false,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (password) {
                        if (password.isEmpty || password.length < 6) {
                          return 'Invalid Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.black,
                        ),
                        child: const Text(
                          'Forgot my password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.9,
                    ),
                    SizedBox(
                      height: 45.0,
                      child: ElevatedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userManager.signIn(
                                    user: User(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                    onFail: (e) {
                                      scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Login failed: $e',
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                    onSuccess: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                }
                              },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
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
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                      ),
                    ),
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
