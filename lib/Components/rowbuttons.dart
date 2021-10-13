import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              child: Text(
                "20",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              onPressed: () => null),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              child: Text(
                "50",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              onPressed: () => null),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              child: Text(
                "250",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              onPressed: () => null),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
              child: Text(
                "500",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              onPressed: () => null),
        ),
      ],
    );
  }
}
