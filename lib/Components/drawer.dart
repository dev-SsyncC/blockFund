import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // column holds all the widgets in the drawer
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: 80,
                  child: Align(
                      child: Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.center),
                ),
                ListTile(
                  title: Text('Create Collection'),
                  leading: Icon(Icons.monetization_on),
                  onTap: () {
                    Navigator.pushNamed(context, '/Create');
                  },
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
            // This align moves the children to the bottom
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: Container(
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                        leading: Icon(Icons.settings), title: Text('Settings')),
                    ListTile(
                      leading: Icon(Icons.logout_rounded),
                      title: Text('Log Out'),
                      onTap: () async {
                        await auth.signOut();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
