import 'package:blockfund/Screens/home.dart';
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
        body: ListView(
      children: [
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, bottom: 50),
                child: Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                  size: 100.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim());

                    final snackBar = SnackBar(
                      content: const Text('Login Successfull'),
                      action: SnackBarAction(
                        label: "",
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    if (auth.currentUser?.uid != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e.code);
                    print(e.message);
                    final snackBar = SnackBar(
                      content: Text(e.message ?? 'some error occured'),
                      action: SnackBarAction(
                        label: "",
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    await auth.createUserWithEmailAndPassword(
                        email: emailcontroller.text.trim(),
                        password: passwordcontroller.text.trim());
                    final snackBar = SnackBar(
                      content: const Text('SignUp Successfull'),
                      action: SnackBarAction(
                        label: "",
                        onPressed: () {},
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text(
                    'Not a member? SignUp now',
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ],
    ));
  }
}
