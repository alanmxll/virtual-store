import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/validators.dart';
import '../../models/user.dart';
import '../../models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              shrinkWrap: true,
              children: [
                TextFormField(
                  autocorrect: false,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                  ),
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
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Text('Forgot my password'),
                  ),
                ),
                const SizedBox(
                  height: 16.9,
                ),
                SizedBox(
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        context.read<UserManager>().signIn(
                              user: User(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                              onFail: (e) {
                                scaffolKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Fail on Sign In: $e'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                print(e);
                              },
                              onSuccess: () {
                                // TODO: CLOSE LOGIN SCREEN
                                print('Success');
                              },
                            );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
