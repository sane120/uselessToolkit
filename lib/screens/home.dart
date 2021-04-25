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
          title: new Text("Toolkit"),
          backgroundColor: Color(0xFFf05454),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Choose your tool from the above"),
                trailing: new Icon(Icons.handyman_outlined),
              ),
              new Divider(),
              new ListTile(
                  title: new Text("Level"),
                  trailing: new Icon(Icons.design_services),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/level');
                  }),
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
                  trailing: new Icon(Icons.design_services),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/deviceinfo');
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
              new Text("Welcome",
                  style: new TextStyle(fontSize: 20.0)),
            ],
          ),
        ));
  }
}
