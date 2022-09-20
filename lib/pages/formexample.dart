import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormExampleState();
}

class _FormExampleState extends State<StatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print(_formKey);
    return Scaffold(
        appBar: AppBar(
          title: const Text('testing forms'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      onSaved: (s) => print(s),
                      validator: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          helperText: '*required',
                          labelText: 'your name',
                          helperStyle: TextStyle(color: Colors.red[900])),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        autocorrect: true,
                        validator: (value) {},
                        keyboardType: TextInputType.multiline,
                        // expands: true,
                        maxLines: null,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            //labelText: 'description',
                            helperText: '*required',
                            helperStyle: TextStyle(color: Colors.red[900])),
                      )),
                ],
              )),
        ));
  }
}

//form is not the only way to take user information you can use TextInput widget to take user input and manage their input individually

//Form is the widget and FormState is the associated state object -- in order to access the state of a form widget you need
//to create a generic GlobalKey of type FormState just like this ==> GlobalKey<FormState> itsname = GlobalKey<FormState>();

//after creating this key you then assign it to the key property of the Form widget just like this ==> key:itsname,

//i don't know about keys that much at this point but from what i read in flutter in action this almost the only
//place that you will use a GlobalKey

//I NEED TO LOOK IN TO KEYS MORE
