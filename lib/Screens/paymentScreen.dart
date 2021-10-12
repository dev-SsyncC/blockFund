import 'package:blockfund/utils/Details.dart';
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  final Detail? block;
  const Payment({Key? key, @required this.block}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        children: [
          Center(child: Text(block!.account ?? 'Account number will be here')),
          Center(
            child: ElevatedButton(
              child: Text('Initiate Transaction'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
