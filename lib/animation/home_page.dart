import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing_flutter_create/animation/home_page_enter_animation.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required AnimationController controller})
      : animation = HomePageEnterAnimation(controller),
        super(key: key);

  final HomePageEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnimatedBuilder(
            animation: animation.controller,
            builder: ((context, child) =>
                buildAnimation(context, child, size))));
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 200,
      left: size.width / 2 - 50,
      child: Transform(
        transform: Matrix4.diagonal3Values(animationValue, animationValue, 1),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue.shade700),
        ),
      ),
    );
  }

  placeHolderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300),
      ),
    );
  }

  buildAnimation(BuildContext context, Widget? child, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 250,
          child: Stack(clipBehavior: Clip.none, children: [
            topBar(animation.barHeight.value),
            circle(size, animation.avaterSize.value)
          ]),
        ),
        Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Opacity(
                  opacity: animation.titleOpacity.value,
                  child: placeHolderBox(28, 250, Alignment.centerLeft),
                ),
                const SizedBox(
                  height: 8,
                ),
                Opacity(
                  opacity: animation.textOpacity.value,
                  child: placeHolderBox(
                      250, double.infinity, Alignment.centerLeft),
                )
              ],
            ))
      ],
    );
  }
}
