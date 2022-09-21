import 'package:flutter/material.dart';
import 'dart:math';

class Face extends AnimatedWidget {
  const Face({Key? key, required Animation<Color> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Color>;
    var screenSize = MediaQuery.of(context).size;
    var painter = Paint()
      ..color = Colors.yellow.shade700
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    return Container(
      height: 200,
      decoration: BoxDecoration(color: animation.value),
      child: CustomPaint(
        size: screenSize,
        painter: FacePainter(facePaint: painter),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
            child: Text(
              'i drew this',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

//canvas painting takes place in customPainter
class FacePainter extends CustomPainter {
  final Paint facePaint;
  FacePainter({required this.facePaint});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 3;
    final center = Offset(size.width / 2, size.height / 2);

    var rectTop = 3.0;
    var rectBottom = rectTop - 140;

    var figureRightEdge = size.width - 200;
    var figureLeftEdge = size.width / 8;

    var cloudBaseRect = Rect.fromPoints(
      Offset(figureLeftEdge, rectTop),
      Offset(figureRightEdge, rectBottom),
    );
    var cloudBase = RRect.fromRectAndRadius(
      cloudBaseRect,
      const Radius.circular(0),
    );

    //the first argument a point which corresponds to circles center
    //the second argument is the radius of the circle
    //the cird argument is the paint instance that specify the various properies of the thing we are painting
    canvas.drawCircle(center, radius, facePaint);

    final smilepaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(center.dx - 4, center.dy), radius: radius / 2),
        0,
        pi,
        false,
        smilepaint);

    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 20, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 20, Paint());

    // canvas.drawRect(
    //     Rect.fromPoints(Offset(145, 200), const Offset(310, 400)),
    //     Paint()
    //       ..color = Colors.yellow.shade900
    //       ..style = PaintingStyle.stroke
    //       ..strokeWidth = 10);
    // canvas.drawRRect(cloudBase, facePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
