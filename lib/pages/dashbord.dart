import 'package:flutter/material.dart';
import 'package:testing_flutter_create/widgets/actual_dashboard.dart';
import 'package:testing_flutter_create/widgets/clouds.dart';
import 'package:testing_flutter_create/widgets/face_painter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late AnimationController _controller;
  final Tween<Color> _colortween =
      Tween<Color>(begin: Colors.red, end: Colors.blue);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    startAnimation();
  }

  @override
  void didUpdateWidget(Dashboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> startAnimation() async {
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 400,
                //aspectRatio: 20 / 30,
                child: Clouds(animation: _colortween.animate(_controller)))));
  }
}
