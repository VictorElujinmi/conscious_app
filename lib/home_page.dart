import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions:<Widget>[IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,),

          onPressed: () {
            //Settings
          }

        ),


        ]

      ),
      body: Center(
        child: Location(),
      ),
    );
  }
}
class Location extends StatefulWidget{
  @override
 _LocationState createState() => _LocationState();
}


class _LocationState extends State<Location> {
  final _suggestions = <String>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
            child: Column (
              children: <Widget>[
                TextField(),
                Location(),
              ]
                )
    )
      );


    }


  Widget _LocationList() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 4 * 2,
        itemBuilder: /*1*/ (context, i) {

          if (i.isOdd) return Divider(); /*2*/
          var location = <String>[];
          final index = i ~/ 2; /*3*/

          _suggestions.addAll(['Bobba Theory', 'Walmart', 'Panama Beach', 'Trader Joes']);
          /*4*/
          return _buildRow(_suggestions[index]);

        });
  }

  Widget _buildRow(String location) {
    return ListTile(
      title: Text(
        location,
        style: _biggerFont,
      ),
    );
  }

}