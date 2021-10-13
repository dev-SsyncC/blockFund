import 'package:blockfund/utils/Details.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final Detail? block;
  const Information({Key? key, @required this.block}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Container(
              //   padding: EdgeInsets.only(left: 10.0),
              //   height: MediaQuery.of(context).size.height * 0.5,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.37,
                padding: EdgeInsets.all(30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 120.0),
                      Text(
                        block!.name ?? 'Name will be here',
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 45.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ],
          ),
          Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    block!.description ?? 'Description will go here',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
