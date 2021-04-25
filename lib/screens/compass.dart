import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => new _CompassPageState();
}

// Navbar and run Compass()
class _CompassPageState extends State<CompassPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color.fromRGBO(57, 62, 70, 1),
        appBar: new AppBar(
          title: new Text('Compass'),
          backgroundColor: Color.fromRGBO(0, 150, 136, 1),
        ),
        body: Container(
          child: Compass(),
        ));
  }
}

void main() => runApp(Compass());

class Compass extends StatefulWidget {
  Compass({Key key}) : super(key: key);

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double _heading = 0;

  String get _readout => _heading.toStringAsFixed(0) + '°';

  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen(_onData);
  }

  void _onData(double x) => setState(() {
        _heading = x;
      });

  // Styles the Text
  final TextStyle _style = TextStyle(
    color: Colors.teal,
    fontSize: 50,
    fontWeight: FontWeight.w200,
  );
// Layout
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: CompassPainter(angle: _heading),
        child: Center(child: Text(_readout, style: _style)));
  }
}

// Paints the Compass
class CompassPainter extends CustomPainter {
  CompassPainter({@required this.angle}) : super();

  final double angle;
  double get rotation => -2 * pi * (angle / 360);

  Paint get _brush => new Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.4;
// Paint final
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = _brush..color = Colors.indigo[600].withOpacity(0.8);
    Paint needle = _brush..color = Colors.red[900];

    double radius = min(size.width / 2.2, size.height / 2.2);
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset start = Offset.lerp(Offset(center.dx, radius), center, .4);
    Offset end = Offset.lerp(Offset(center.dx, radius), center, 0.1);
// Logic that canvas moves
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawLine(start, end, needle);
    canvas.drawCircle(center, radius, circle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}