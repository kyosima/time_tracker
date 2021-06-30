import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/model/job.dart';
import 'package:time_tracker/services/api_path.dart';
import 'package:time_tracker/services/auth.dart';
import 'package:time_tracker/services/database.dart';

class JobPage extends StatelessWidget {
  void _createJob(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.createJob(Job(name: 'Flutter', rate: 15));
    } on FirebaseException catch (e) {
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
    }
  }

  Future<void> _signOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);

    try {
      await auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    if (!Platform.isIOS) {
      final cfSignout = await showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Are you sure to logout?"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => _signOut(context),
                    child: Text("Yes"),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  )
                ],
              ));
      if (cfSignout == true) {
        _signOut(context);
      }
    } else {
      final cfSignout = await showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text("Are you sure to logout ?"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () => _signOut(context),
                    child: Text("Yes"),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  )
                ],
              ));
      if (cfSignout == true) {
        _signOut(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    database.readJob();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: () => _confirmSignOut(context),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ))
        ],
      ),
      body: _buildContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () => _createJob(context),
      ),
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
