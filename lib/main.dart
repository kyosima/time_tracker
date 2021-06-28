import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/landingpage.dart';
import 'package:time_tracker/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Kyo App",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
