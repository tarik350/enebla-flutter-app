import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
            backgroundColor: Theme.of(context).primaryColor),
        color: Colors.red,
        home: const MyHomePage(
          title: "Hello world!",
        ));
  }
}

class FirstNameText extends StatefulWidget {
  const FirstNameText({Key? key}) : super(key: key);

  @override

  // ignore: no_logic_in_create_state
  State<FirstNameText> createState() => _FirstNameTextState("sisay teshome");
}

class _FirstNameTextState extends State<FirstNameText> {
  _FirstNameTextState(this.name);
  String name;

  void _say_hello() {
    setState(() {
      name = "hello sis!";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 81, 1, 95),
        appBar: AppBar(
          title: const Text('Flutter is great'),
          toolbarHeight: 50,
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 50,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 20),
                        const Offset(150, 20),
                        <Color>[
                          Colors.red,
                          Colors.yellow,
                        ],
                      )),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _say_hello,
          tooltip: 'increment',
          child: const Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _boss = 'Tarik Teshome';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _counter + 1;

      if (_counter <= 5) {
        _boss = "YEP HE IS THE BOSS";
      } else if (_counter <= 10) {
        _boss = "ALRIGHT MEN THAT IS ENOUGH I ALREADY TOLD YOU!!";
      } else if (_counter <= 15) {
        _boss = "MY GOD I AM HORRY AS FUCK";
      } else if (_counter <= 20) {
        _boss = "YOU ARE KILLING ME MEN 😫";
      } else {
        _boss = "FUCK YOU MEN I DON'T EVEN CARE ANYMORE!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'stop clicking that button men you are making me horney:',
            ),
            Text(
              ' $_boss',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment',
        child: const Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
