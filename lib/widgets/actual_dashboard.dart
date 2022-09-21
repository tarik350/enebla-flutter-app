import 'package:flutter/material.dart';
import 'package:testing_flutter_create/widgets/face_painter.dart';

class ActualDashbord extends AnimatedWidget {
  const ActualDashbord({Key? key, required Animation<Color> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Color>;
    var maxWidth = MediaQuery.of(context).size.width;

    //the width of the screen times 3 dvided by 20 ==> that will be the margin

    var margin = (maxWidth * .3) / 2;

    return Scaffold(
        body: Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: margin),
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: animation.value,
          ),
        ),
      ),
    ));
  }
}
