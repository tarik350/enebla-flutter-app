import 'package:flutter/material.dart';
import 'package:testing_flutter_create/animation/home_page.dart';
import 'package:testing_flutter_create/widgets/sun.dart';
import 'package:testing_flutter_create/animation/homeAnimator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController _colorAnimationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final ColorTween _colorTween =
      ColorTween(begin: Colors.red.shade800, end: Colors.yellow.shade800);
  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    _colorAnimationController.repeat(reverse: true);
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Tween<Offset> _positionOffsetTween =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, .1));

    //this is just for the youtube tutorial i am watching
    // return Scaffold(body: HomePageAnimator());

    return Scaffold(
      body: GestureDetector(
          onTap: () {
            initAnimation();
          },
          onDoubleTap: () {
            _controller.reverse();
          },
          child: Center(
            child: SlideTransition(
              position: _positionOffsetTween.animate(
                  _animation.drive(CurveTween(curve: Curves.bounceIn))),
              child: Sun(
                  animation: _colorTween.animate(_colorAnimationController)),
            ),
          )),
    );
  }

  void stopAnimation() {
    _controller.reset();
    _colorAnimationController.reset();
  }
}
