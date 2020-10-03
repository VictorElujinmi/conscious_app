
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();

}


class _State extends State<MyApp> {
  static int Passcode = 0;
  @override
  Widget build(BuildContext context) {
    Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        // controller: Passcode,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter the sensor ID',
        ),
      ),
    );
    Container(
    height: 50,
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: RaisedButton(
    textColor: Colors.white,
    color: Colors.blue,
    child: Text('Confirm'),
    onPressed: () {
    // print(nameController.text);
    // print(passwordController.text);
    },
    ));

  }

//dfd

}
