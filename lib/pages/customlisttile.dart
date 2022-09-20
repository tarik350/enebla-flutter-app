import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  State<CustomListTile> createState() => CustomListTileState();
}

class CustomListTileState extends State<CustomListTile> {
  bool b = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Expanded(
                    child: Material(
                        child: CheckboxListTile(
                      value: b,
                      // ignore: prefer_const_constructors
                      title: Text('hello world'),
                      onChanged: (b) => _handleChange(b!),
                    )),
                  );
                }))
      ],
    );
  }

  //so besically ! this operator checks if the value is null or not

  _handleChange(bool b) {
    setState(() {
      b = true;
    });
  }
}
