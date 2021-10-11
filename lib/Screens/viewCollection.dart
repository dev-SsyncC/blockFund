import 'package:flutter/material.dart';

class ViewCollection extends StatefulWidget {
  const ViewCollection({Key? key}) : super(key: key);

  @override
  _CreatViewCollection createState() => _CreatViewCollection();
}

class _CreatViewCollection extends State<ViewCollection> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewCollection'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('showing null'),
          )
        ],
      ),
    );
  }
}
