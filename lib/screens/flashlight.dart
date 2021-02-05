import 'package:flutter/material.dart';
import 'package:flashlight/flashlight.dart';

class FlashlightPage extends StatefulWidget {
  @override
  _FlashlightPageState createState() => new _FlashlightPageState();
}

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

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

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
