import 'package:blockfund/Screens/informationScreen.dart';
import 'package:blockfund/Screens/paymentScreen.dart';
import 'package:blockfund/utils/Details.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Detail? block;
  MyCard({Key? key, @required this.block}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(block!.name ?? 'Card title 1'),
            subtitle: Text(
              block!.key ?? 'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              block!.description ??
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Information(block: block),
                    ),
                  );
                },
                child: const Text('Learn more'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(block: block),
                    ),
                  );
                },
                child: const Text('Send help'),
              ),
            ],
          ),
          // Image.asset('assets/card-sample-image.jpg'),
          // Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
