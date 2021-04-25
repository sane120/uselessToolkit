import 'dart:math';

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
           sensorView(100, 100, 100)
      ),
    );
  }
}

Widget sensorView(double ax, double ay, double az) {
  return Expanded(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          // A CustomPaint is a widget which needs a paint strategy (a Painter)
          child:CustomPaint(
            size: Size.infinite,
            painter: SpiritLevelPainter(ax, ay),
          )
      )
  );
}
class SpiritLevelPainter extends CustomPainter {
  double ax, ay;
  SpiritLevelPainter(this.ax, this.ay);

  @override
  void paint(Canvas canvas, Size size) {
    final bubbleRadius = 10.0;
    // Calculate the parameters from the actual size
    var radius = size.shortestSide/2-bubbleRadius;
    var center = Offset(size.width/2, size.height/2);

    // draw circumference of the spirit level
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius+bubbleRadius, paint);
    canvas.drawCircle(center, bubbleRadius+3.0, paint);

    // Get normalized sensor data
    var normalizedData = _normalizeData(scaleBy: 5.0);

    // Draw the bubble
    paint
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    var bubbleCenter = Offset(radius * normalizedData[0], radius * normalizedData[1]);
    bubbleCenter = bubbleCenter.translate(center.dx, center.dy);
    canvas.drawCircle(bubbleCenter, bubbleRadius, paint);
    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(bubbleCenter, bubbleRadius, paint);
  }

  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  List<double> _normalizeData({double scaleBy = 1.0}) {
    double x,y;
    // Compensate for gravitation
    x = (ax/9.8);
    y = (-ay/9.8);

    // scale values
    x *= scaleBy;
    y *= scaleBy;

    // Normalize to [-1..1]
    if (x > 1) x = 1; if (x < -1) x = -1;
    if (y > 1) y = 1; if (y < -1) y = -1;

    // Ensure circle restrictions
    var len = sqrt(x*x + y*y);
    if (len > 1.0) {
      x /= len;
      y /= len;
    }
    return [x, y];
  }
}