import 'dart:io';

import 'package:flutter/material.dart';

class Clouds extends AnimatedWidget {
  const Clouds({Key? key, required Animation<Color> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Color>;
    var screenSize = MediaQuery.of(context).size;
    var painter = Paint()
      ..color = animation.value
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    return Container(
      height: 500,
      decoration: BoxDecoration(color: Colors.yellow[800]),
      child: CustomPaint(
        painter: CloudPainter(cloudPainter: painter),
        size: screenSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          //children: [Text('i drew this'), Text('it was a nice experiance')],
        ),
      ),
    );
  }
}

class CloudPainter extends CustomPainter {
  Paint cloudPainter;
  CloudPainter({Key? key, required this.cloudPainter});

  @override
  void paint(Canvas canvas, Size size) {
    var rectTop = size.height / 2 + 10;
    var rectBottom = rectTop + 40.0;

    var figureLeftEdge = size.width * .25;
    var figureRightEdge = size.width * .75;
    var figureCenter = size.width / 2;

    var cloudBase = RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(figureLeftEdge, rectTop - 10),
          Offset(figureRightEdge, rectBottom),
        ),
        Radius.circular(10));

    canvas.drawCircle(
        Offset(figureLeftEdge + 5, size.height / 2), 50, cloudPainter);
    canvas.drawCircle(
        Offset(figureCenter, size.height / 2 - 30), 60, cloudPainter);
    canvas.drawCircle(
        Offset(figureRightEdge, size.height / 2 - 30), 80, cloudPainter);
    canvas.drawRRect(cloudBase, cloudPainter);

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //         Rect.fromPoints(Offset(size.width * 0.25, size.height * .25),
    //             Offset(size.width * 0.75, size.height * .75)),
    //         Radius.circular(0)),
    //     Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
