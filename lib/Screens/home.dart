import 'package:blockfund/Components/card.dart';
import 'package:blockfund/Components/drawer.dart';
import 'package:blockfund/utils/Details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseDatabase.instance.reference().child('/feedChild');

  List<Detail> list = [];

  @override
  void initState() {
    super.initState();
    db.once().then((DataSnapshot snap) {
      var data = snap.value;
      list.clear();
      data.forEach((key, value) {
        Detail detail = new Detail(
          key: key,
          name: value['name'],
          account: value['account'],
          description: value['description'],
        );
        list.add(detail);
      });
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'blockFund',
            // style: TextStyle(fontFamily: ),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container(
          child: list.length == 0
              ? Center(child: CircularProgressIndicator())
              : new ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return MyCard(block: list[index]);
                  }),
        ));
  }
}
