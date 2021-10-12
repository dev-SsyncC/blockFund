import 'package:blockfund/Screens/createCollection.dart';
import 'package:blockfund/Screens/home.dart';
import 'package:blockfund/Screens/informationScreen.dart';
import 'package:blockfund/Screens/login.dart';
import 'package:blockfund/Screens/paymentScreen.dart';
import 'package:blockfund/Screens/viewCollection.dart';
import 'package:blockfund/utils/Details.dart';
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
        '/payment': (context) => Payment(
              block: Detail(),
            ),
        '/info': (context) => Information(
              block: Detail(),
            ),
      },
      home: Login(),
    );
  }
}
