import 'package:flutter/material.dart';
import 'package:flashlight/flashlight.dart';

// New Page
class FlashlightPage extends StatefulWidget {
  @override
  _FlashlightPageState createState() => new _FlashlightPageState();
}

// Navbar and new page handling
class _FlashlightPageState extends State<FlashlightPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flashlight'),
          backgroundColor: Color(0xFFf05454),
        ),
        body: Container(
          child: FlashlightGo(),
        ));
  }
}

void main() => runApp(FlashlightGo());

class FlashlightGo extends StatefulWidget {
  @override
  _FlashlightGoState createState() => _FlashlightGoState();
}

class _FlashlightGoState extends State<FlashlightGo> {
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

// Does the device have flashlight?
  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

// Buttons and function
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
            Text(_hasFlashlight
                ? 'Your phone has a Flashlight.'
                : 'Your phone has no Flashlight.'),
            RaisedButton(
              child: Text('Turn on'),
              onPressed: () => Flashlight.lightOn(),
            ),
            RaisedButton(
              child: Text('Turn off'),
              onPressed: () => Flashlight.lightOff(),
            )
          ],
        )),
      ),
    );
  }
}
