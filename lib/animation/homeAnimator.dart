import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:testing_flutter_create/animation/home_page.dart';

class HomePageAnimator extends StatefulWidget {
  const HomePageAnimator({Key? key}) : super(key: key);

  @override
  State<HomePageAnimator> createState() => _HomePageAnimatorState();
}

class _HomePageAnimatorState extends State<HomePageAnimator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _colorController;

  @override
  void initState() {
    super.initState();
    _colorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..repeat();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          HomePage(controller: _controller, colorController: _colorController),
    );
  }
}
