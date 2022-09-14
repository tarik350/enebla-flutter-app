import 'package:flutter/material.dart';
// THIS IS JUST A CODE I HAVE WRITTEN FOR TRAINING

class RandomExample extends StatefulWidget {
  const RandomExample({Key? key}) : super(key: key);
  @override
  State<RandomExample> createState() => _RandomExampleState();

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Column(
  //           // ignore: prefer_const_literals_to_create_immutables
  //           children: <Widget>[
  //             Expanded(child: Text('Hello World from RandomExampleExample widget!!'))
  //           ],
  //         )
  //       ],
  //     ),
  //   ));
  // }
}

class _RandomExampleState extends State<RandomExample> {
  var attitude =
      'a dude struggling to find fucks b/c he does not have any to give for those who are in need!!';

  int click = 0;

  void whatIsMyAttitude() {
    setState(() {
      if (click == 0) {
        attitude =
            'a dude struggling to find fucks b/c he does not have any to give for those who are in need!!';
      } else if (click == 1) {
        attitude = 'ok ok that is fine';
      } else if (click == 2) {
        attitude = 'what is wrong with you men stop ';
      } else {
        attitude = "alright that is enough men fuck you ";
      }
      click++;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            attitude,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'sans-serif',
                fontWeight: FontWeight.w700),
          ),
          RaisedButton(
            onPressed: whatIsMyAttitude,
            color: Colors.green,
            child: const Text('check out out my attitude'),
          )
        ],
      )),
    );
  }
}

/// THIS IS AN LISTVIEW AND GRIDVIEW EXAMPLE I GOT FROM FLUTTER.DEV
///
///