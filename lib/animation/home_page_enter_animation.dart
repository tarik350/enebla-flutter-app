import 'package:flutter/material.dart';

class HomePageEnterAnimation {
  HomePageEnterAnimation(this.controller, this.colorController)
      : barHeight = Tween<double>(begin: 0, end: 250).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.3, curve: Curves.easeInCirc),
          ),
        ),
        avaterSize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.6, curve: Curves.elasticOut),
          ),
        ),
        titleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 0.65, curve: Curves.easeIn),
          ),
        ),
        textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.65, 0.8),
          ),
        ),
        colorTween = ColorTween(begin: Colors.grey.shade300, end: Colors.black)
            .animate(colorController);
  final AnimationController colorController;
  final AnimationController controller;
  final Animation<double> barHeight;
  final Animation<double> avaterSize;
  final Animation<double> titleOpacity;
  final Animation<double> textOpacity;
  final Animation<Color?> colorTween;
}
