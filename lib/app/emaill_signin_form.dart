import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/validator.dart';

enum EmailSignInFormType { signIn, regiter }

class EmailSignInForm extends StatefulWidget with EmailandPasswordValidator {
  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  void _submit(BuildContext context) async {
    setState(() {
      _submitted = true;
    });
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailandPassword(_email, _password);
      } else {
        await auth.createWithEmailandPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (!Platform.isIOS) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("ERROR"),
                  content: Text(e.message),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Ok"))
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
                  title: Text("ERROR"),
                  content: Text(e.message),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Ok"))
                  ],
                ));
      }
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.regiter
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChild() {
    final pritext = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create a Account';
    final secondtext = _formType == EmailSignInFormType.signIn
        ? "Don't have account ? Register"
        : "Already have account! Sign in";

    bool _submitEnable = widget.emailvalidator.isValid(_email) &&
        widget.passwordvalidator.isValid(_password);
    bool showErrorText = _submitted && !widget.emailvalidator.isValid(_email);
    bool showErrorPassword =
        _submitted && !widget.emailvalidator.isValid(_password);

    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'email@gmail.com',
            errorText: showErrorText ? "Email can't empty" : null),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (_email) => _inputUpdate(),
      ),
      SizedBox(
        height: 10,
      ),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password',
            errorText: showErrorPassword ? "Password can't empty" : null),
        onChanged: (_password) => _inputUpdate(),
      ),
      SizedBox(
        height: 10,
      ),
      RaisedButton(
        onPressed: _submitEnable ? () => _submit(context) : null,
        child: Text(
          pritext,
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue,
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: _toggleFormType,
              child: Text(
                secondtext,
                style: TextStyle(
                  color: Colors.black,
                ),
              ))
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildChild(),
        ),
      ),
    );
  }

  void _inputUpdate() {
    setState(() {});
  }
}
