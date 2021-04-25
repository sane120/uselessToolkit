import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFFe8e8e8),
        appBar: new AppBar(
          title: new Text("The handy handy app"),
          backgroundColor: Color.fromRGBO(0, 150, 136, 1),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Menu"),
                trailing: new Icon(Icons.help),
              ),
              new Divider(),
              new ListTile(
                  title: new Text("Flashlight"),
                  trailing: new Icon(Icons.highlight_outlined),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/flashlight');
                  }),
              new ListTile(
                  title: new Text("Compass"),
                  trailing: new Icon(Icons.navigation),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/compass');
                  }),
              new ListTile(
                  title: new Text("Device Info"),
                  trailing: new Icon(Icons.info),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/deviceinfo');
                  }),
              new ListTile(
                  title: new Text("My Business Card"),
                  trailing: new Icon(Icons.card_travel),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/card');
                  }),
            ],
          ),
        ),
        body: new Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/numas_icon.png', width: 300,),
              SizedBox(height: 100,),
              new Text("Welcome to my app!",
                  style: new TextStyle(fontFamily: 'Pacifico',fontSize: 30.0)),
            ],
          ),
        ));
  }
}
