import 'package:blockfund/createCollection.dart';
import 'package:blockfund/home.dart';
import 'package:blockfund/login.dart';
import 'package:blockfund/viewCollection.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'blockFund',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/home': (context) => Home(),
        '/Create': (context) => CreateCollection(),
        '/view': (context) => ViewCollection(),
      },
      home: Login(),
    );
  }
}
