import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/flashlight.dart';
import 'screens/level.dart';
import 'screens/compass.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(),
        '/flashlight': (BuildContext context) => new FlashlightPage(),
        '/level': (BuildContext context) => new LevelPage(),
        '/compass': (BuildContext context) => new CompassPage(),
      },
    );
  }
}
