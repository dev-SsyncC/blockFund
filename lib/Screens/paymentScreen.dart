import 'package:blockfund/Components/rowbuttons.dart';
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
          ListTile(
            contentPadding: EdgeInsets.only(left: 0),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance),
              iconSize: 45,
            ),
            title: Text(block!.name ?? 'Reciver\'s name here'),
            subtitle: Text(block!.account ?? 'UPI ID'),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Or send',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MyButtons(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: Text('Initiate Transaction'),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
