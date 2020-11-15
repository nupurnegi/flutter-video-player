import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vidproject/Home.dart';
import 'Logpage.dart';
import 'videomain.dart';
void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title : "Login",
      theme: new ThemeData( 
        primarySwatch: Colors.green,
      ),
      home : new Login(),
    );
  }
}
