import 'package:flutter/material.dart';
import 'package:time_tracker/common/button_signin.dart';
import 'package:flutter/animation.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        elevation: 10,
      ),
      body: buildContainer(),
    );
  }

  Widget buildContainer() {
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
                onPress: () {
                  print("Sign in with Google");
                },
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
                onPress: () {
                  print("Sign in with facebook");
                },
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
                onPress: () {
                  print("Sign in with email");
                },
                borderRadius: 4,
                textColor: Colors.white,
                LinkIMG: 'assets/images/email.png',
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
                  onPressed: () {},
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
