import 'package:flutter/material.dart';

class ListTileExample extends StatefulWidget {
  const ListTileExample({Key? key}) : super(key: key);

//const ListTileExample({key:key}):super(key: key);

  @override
  State<StatefulWidget> createState() => ListTileExampleState();
}

class ListTileExampleState extends State<ListTileExample> {
  String txt = '';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksforGeeks'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue[50],
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text(
                  'GFG title',
                  textScaleFactor: 1.5,
                ),
                trailing: const Icon(Icons.done),
                subtitle: const Text('This is subtitle'),
                selected: true,
                onTap: () {
                  setState(() {
                    txt = 'List Tile pressed';
                  });
                },
              ),
            ),
          ),
          Text(
            txt,
            textScaleFactor: 2,
          )
        ],
      ),
    );
  }
}
