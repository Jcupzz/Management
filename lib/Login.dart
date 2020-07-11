import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _password, _email;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          //logout option widget
        ],
      ),
      body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Please enter something";
                  }
                },
                onSaved: (input) {
                  _email = input;
                },
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Enter Password";
                  }
                },
                onSaved: (input) {
                  _password = input;
                },
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Sign In"),
              )
            ],
          )),
    );
  }

  void signIn() {
    final formVal = _formkey.currentState;

    if (formVal.validate()) {
      //login
    }
  }
}