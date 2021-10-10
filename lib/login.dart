import 'package:blockfund/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              obscureText: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await auth.signInWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim());
                    if (auth.currentUser?.uid != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    } else {
                      print('error');
                    }
                  },
                  child: Text('Login')),
              ElevatedButton(
                  onPressed: () async {
                    await auth.createUserWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim());
                    final snackBar = SnackBar(
                      content: const Text('SignUp Successfull'),
                      action: SnackBarAction(
                        label: "",
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('SignUp')),
            ],
          ),
        ],
      ),
    ));
  }
}
