import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  return null;
                },
              ),
              const SizedBox(
                height: 16.9,
              ),
              TextFormField(
                autocorrect: false,
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
                  onPressed: () {},
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
    );
  }
}
