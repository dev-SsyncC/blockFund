import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewCollection extends StatefulWidget {
  const ViewCollection({Key? key}) : super(key: key);

  @override
  _CreatViewCollection createState() => _CreatViewCollection();
}

class _CreatViewCollection extends State<ViewCollection> {
  final _database = FirebaseDatabase.instance.reference();
  String? displaytext;

  @override
  void initState() {
    super.initState();
    _activateListners();
  }

  void _activateListners() {
    _database.child('/feedChild').onValue.listen((event) {
      final description = new Map<String, dynamic>.from(event.snapshot.value);
      final data = description['name'] as String;
      setState(() {
        displaytext = data;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewCollection'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(displaytext ?? 'showing null'),
          )
        ],
      ),
    );
  }
}
