import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CreateCollection extends StatefulWidget {
  const CreateCollection({Key? key}) : super(key: key);

  @override
  _CreateCollectionState createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
  final database = FirebaseDatabase.instance.reference();

  var _name = TextEditingController();
  var _account = TextEditingController();
  var _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateCollection'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(hintText: "name"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _account,
              decoration: InputDecoration(hintText: "account number"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _description,
              decoration: InputDecoration(hintText: "Description"),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () async {
                  await database.child('/feedChild').push().set({
                    'name': _name.text,
                    'account': _account.text,
                    'description': _description.text,
                  }).catchError((e) => {print("you got an error")});
                  print('query added');
                },
              )),
        ],
      ),
    );
  }
}
