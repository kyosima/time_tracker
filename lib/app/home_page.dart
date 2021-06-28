import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ))
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      child: Center(
        child: Text(
          "Home Page After Login",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
