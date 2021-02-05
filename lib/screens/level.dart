import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => new _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFe8e8e8),
      appBar: new AppBar(
        title: new Text('Level'),
        backgroundColor: Color(0xFFf05454),
      ),
      body: new Center(
        child:
            new Text("Level Page TODO", style: new TextStyle(fontSize: 35.0)),
      ),
    );
  }
}

//TODO
