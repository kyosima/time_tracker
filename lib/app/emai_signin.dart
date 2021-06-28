import 'package:flutter/material.dart';
import 'package:time_tracker/app/emaill_signin_form.dart';
import 'package:time_tracker/services/auth.dart';

class EmailSignIn extends StatelessWidget {
  EmailSignIn({@required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Email"),
        elevation: 10,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
          ),
        ),
      ),
    );
  }
}
