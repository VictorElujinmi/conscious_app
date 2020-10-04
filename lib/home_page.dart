import 'package:flutter/material.dart';
import 'SimpleTimeSeriesChart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Testing',
      style: optionStyle,
    ),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Map',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;



      //Nav Code here
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Testing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded ),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
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

                Container(
                  height: 215,
                  child:_LocationList(),
                )
                ,
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
                  children: <Widget>[
                   Padding(
                     padding: EdgeInsets.all(25.0),
                     child:  blockInfo("94", "Students"),
                   )
                    ,
                    blockInfo("20", "Infected"),

                  ],
                ),
                Expanded(
                     child: Padding(
                       padding: EdgeInsets.only(top:50.0),
                     child:SimpleTimeSeriesChart.withSampleData()))
                ,

              ]

                )
    )
      );
    }


    Widget blockInfo(String number, String text) {
      return (
      Column (
        children: <Widget>[

         Text(text)
          ,Container(
              padding: new EdgeInsets.all(15.0),
              height: 55,
              width: (MediaQuery.of(context).size.width/2) - 50,
              child: new Text (
                  number,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900
                  )
              ),
              decoration: new BoxDecoration (
                  color: Colors.grey[350]
              )
          )
      ])
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

        }



        );
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

