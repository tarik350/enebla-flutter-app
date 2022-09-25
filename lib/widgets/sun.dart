import 'package:flutter/material.dart';

class Sun extends AnimatedWidget {
  Sun({Key? key, required Animation<Color?> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color?> animation = listenable as Animation<Color?>;
    var maxWidth = MediaQuery.of(context).size.width;

    //the width of the screen times 3 dvided by 20 ==> that will be the margin

    var margin = (maxWidth * .3) / 2;

    return Container(
      width: maxWidth * .5,
      margin: EdgeInsets.symmetric(horizontal: margin),
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: animation.value,
      ),
    );
  }
}
