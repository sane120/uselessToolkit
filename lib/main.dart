import 'package:flutter/material.dart';
import 'package:toolkit/screens/deviceinfo.dart';
import 'screens/home.dart';
import 'screens/flashlight.dart';
import 'screens/level.dart';
import 'screens/compass.dart';

// MyApp default
void main() => runApp(new MyApp());

//Navbar
class MyApp extends StatelessWidget {
  // Root of the application/ Navbar
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
        '/deviceinfo': (BuildContext context) => new devInfosPage(),
      },
    );
  }
}
