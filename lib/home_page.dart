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
                Text('Places Ive been to', textAlign: TextAlign.left,),
                _LocationList(),
            Container(
                padding: new EdgeInsets.all(20.0),
              height: 60,
                width: MediaQuery.of(context).size.width,
                child: new Text (
                    "Covid-19 Dashboard",
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900
                    )
                ),
                decoration: new BoxDecoration (
                    color: Colors.blue
                )
            ),
                Row(

                )

              ]

                )
    )
      );
    }


  Widget _LocationList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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

      leading: Column (
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            Icon(
              Icons.mood_rounded ,
              color: Colors.green,
            ),
      Text('Safe'),
        ],
      ),

        title: Text(
        location,
        style: _biggerFont,
    ));


  }

}