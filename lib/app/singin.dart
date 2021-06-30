import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/email_signin.dart';
import 'package:time_tracker/app/phone_signin.dart';
import 'package:time_tracker/common/button_signin.dart';
import 'package:time_tracker/services/auth.dart';

class Signin extends StatelessWidget {
  Future<void> _signInAnonymously(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);

    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);

    try {
      await auth.singInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);

    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignIn(),
      ),
    );
  }

  void _signInWithPhone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (context) => PhoneSignIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 30,
      ),
      body: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'), fit: BoxFit.cover)),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 70,
            image: AssetImage('assets/images/logo.png'),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              'Sign in',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              SignInButton(
                text: "Sign in with Google",
                color: Colors.white,
                onPress: () => _signInWithGoogle(context),
                borderRadius: 4,
                textColor: Colors.black,
                LinkIMG: 'assets/images/google.png',
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                text: "Sign in with Facebook",
                color: Colors.blue,
                onPress: () => _signInWithFacebook(context),
                borderRadius: 4,
                textColor: Colors.white,
                LinkIMG: 'assets/images/facebook.png',
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                text: "Sign in with Email",
                color: Colors.blueGrey,
                onPress: () => _signInWithEmail(context),
                borderRadius: 4,
                textColor: Colors.white,
                LinkIMG: 'assets/images/email.png',
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                text: "Sign in with Phone",
                color: Colors.lightGreen,
                onPress: () => _signInWithPhone(context),
                borderRadius: 4,
                textColor: Colors.white,
                LinkIMG: 'assets/images/phone.png',
              ),
              Divider(
                color: Colors.grey,
                height: 20,
              ),
              Text(
                "Or",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 50,
                child: RaisedButton(
                  color: Colors.orange,
                  onPressed: () => _signInAnonymously(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go Anonymous",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
