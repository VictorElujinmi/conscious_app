import 'home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Sensor(),
  ));
}

class Sensor extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Sensor> {
  static int Passcode = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Enter the Sensor ID to pair")),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                // controller: Passcode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the sensor ID',
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  height: 70,
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Sign in'),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )),
              Icon(Icons.check_sharp, color: Colors.green,size: 30,),
              Text("Wait till the sensor checks green")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
  }
}
