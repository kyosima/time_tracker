import 'package:flutter/material.dart';
import 'package:time_tracker/app/singin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kyo App",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Signin(),
    );
  }
}
