import 'package:blockfund/drawer.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
