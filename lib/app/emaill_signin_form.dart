import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

enum EmailSignInFormType { signIn, regiter }

class EmailSignInForm extends StatefulWidget {
  EmailSignInForm({@required this.auth});
  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  void _submit() async {
    try {
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailandPassword(_email, _password);
      } else {
        await widget.auth.createWithEmailandPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
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

    bool _submitEnable = _email.isNotEmpty && _password.isNotEmpty;

    return [
      TextField(
        controller: _emailController,
        decoration:
            InputDecoration(labelText: 'Email', hintText: 'email@gmail.com'),
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        onChanged: (_email) => _inputUpdate(),
      ),
      SizedBox(
        height: 10,
      ),
      TextField(
        onChanged: (_password) => _inputUpdate(),
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
      ),
      SizedBox(
        height: 10,
      ),
      RaisedButton(
        onPressed: _submitEnable ? _submit : null,
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
