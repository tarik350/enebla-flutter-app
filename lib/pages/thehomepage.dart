import 'dart:math';

import 'package:flutter/material.dart';

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

  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  String _boss = 'Tarik Teshome';

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetConter() {
    setState(() {
      _swap();
    });
  }

  void _swap() {
    _reversed = !_reversed;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

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

  // class panicButton extends StatefulWidget{

  //State<PanicButton> createState() => _panicButtonState();

  // }

  // class _panicButtonState extends State<PanicButton>{

  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final incrementButton = FancyButton(
      key: _buttonKeys.first,
      child: Text('increment'),
      onpressed: _incrementCounter,
    );

    final decrementButton = FancyButton(
      key: _buttonKeys.last,
      child: Text('decrement'),
      onpressed: _decrementCounter,
    );

    List<Widget> _buttons = [incrementButton, decrementButton];

    if (_reversed) {
      _buttons = _buttons.reversed.toList();
    }

    return Scaffold(
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
            Container(
              margin: const EdgeInsets.all(20),
              //padding: EdgeInsets.symmetric(vertical: 5),
              //margin: EdgeInsets.symmetric(vertical: 7),
              child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  //defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: <TableRow>[
                    TableRow(children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: const Text('users',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          // ignore: prefer_const_constructors
                          child: Text(
                            'users names',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'MsMadi'),
                          ))
                    ]),
                    // ignore: prefer_const_constructors
                    // ignore: prefer_const_literals_to_create_immutables
                    // ignore: prefer_const_constructors
                    // ignore: prefer_const_literals_to_create_immutables
                    // ignore: prefer_const_constructors
                    TableRow(children: [
                      // ignore: prefer_const_constructors
                      TableCell(
                        child: const Text('user1'),
                      ),

                      TableCell(
                        child: Text('tarik teshome'),
                      )
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Text('user2'),
                      ),
                      TableCell(
                        child: Text('sisay teshome'),
                      )
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: Text('user3'),
                      ),
                      TableCell(
                        child: Text('zelalem teshome'),
                      )
                    ])
                  ]),
            ),
            const Text(
              'stop clicking that button men you are making me horney:',
            ),
            Text(
              ' $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[_buttons[0], _buttons[1]],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetConter,
        tooltip: 'reset counter',
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//FANCY BUTTON CLASS

class FancyButton extends StatefulWidget {
  final VoidCallback onpressed;
  final Widget child;

  const FancyButton({key, required this.onpressed, required this.child})
      : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

//FANCY BUTTON STATE CLASS
class _FancyButtonState extends State<FancyButton> {
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: widget.onpressed, child: widget.child, color: _getColor()),
    );
  }

  Color _getColor() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 10)]);
  }

  Map<_FancyButtonState, Color> _buttonColors = {};
  final _random = Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.amber,
    Colors.lightBlue,
    Colors.lime,
    Colors.teal,
    Colors.transparent,
    Colors.cyanAccent
  ];
}
