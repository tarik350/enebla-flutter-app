import 'package:flutter/material.dart';

// import 'package:testing_flutter_create/pages/login_page.dart';

final List<String> eastAfrica = [
  'Ethiopia',
  'kenya',
  'somalia',
  'djibuti',
  'Ertria'
];
String? animalChossen;
final List<String> animals = ['Dog', 'Cat', 'Tiger', 'Lion'];
final List<String> month = ['month', 'oct', 'sept', 'dec', 'nov'];
//final List<String> another = yearGenerator();
// final List<String> days = dayGenerator();
List<String> years = ['year', '1999', '2000', '2001'];
List<String> days = ['day', '1', '2', '3', '4'];

// [1999, 2000, 2001 ,2002,2003,2004,2005]

List<String> dayGenerator() {
  List<String> day = [];
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int begin = currentYear - 30;
  for (int i = 1; i <= 30; i++) {
    day[i] = (begin + i).toString();
  }

  return day;
}

List<String> yearGenerator() {
  List<String> years = [];
  for (int i = 1; i <= 30; i++) {
    years[i] = i.toString();
  }

  return years;
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode focusNode;
  String? dropdownValue = eastAfrica.first;
  String? monthValue = month.first;
  String? yearValue = years.first;
  String? dayValue = days.first;
  String? animal = 'Dog';

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // print(yearGenerator());
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leadingWidth: 100,
          leading: TextButton(
            child: Row(children: const [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
                size: 20,
              ),
              Text(
                'login',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
                        // padding: EdgeInsets.only(bottom: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'enebla',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Text('|',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.red)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'always delecious',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        )),
                    //
                    //const Spacer(flex: 1),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            focusNode: focusNode,
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: 'fist name',
                                helperText: '*required',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3, color: Colors.red),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 3,
                                          color:
                                              Color.fromARGB(255, 0, 139, 253)),
                                      borderRadius: BorderRadius.circular(50)),
                                  labelText: 'second name',
                                  helperText: '*required',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'this field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Text(' country',
                                style: TextStyle(fontSize: 20)),
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                //margin: EdgeInsets.all(8),
                                //padding: const EdgeInsets.symmetric(vertical: 25),
                                child: DropdownButtonFormField(
                                    value: dropdownValue,
                                    elevation: 6,
                                    // isExpanded: true,

                                    focusColor: Colors.red,
                                    borderRadius: BorderRadius.circular(12),
                                    //itemHeight: 100,
                                    // menuMaxHeight: 100,

                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    items: eastAfrica
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value;
                                      });
                                    }),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Text('age', style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        //month
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: DropdownButtonFormField(
                              value: monthValue,
                              items: month.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String? value) {
                                monthValue = value;
                              },
                            ),
                          ),
                        ),
                        //day

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: DropdownButtonFormField(
                              value: dayValue,
                              items: days.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String? value) {
                                monthValue = value;
                              },
                            ),
                          ),
                        ),
                        //year
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: DropdownButtonFormField(
                                value: yearValue,
                                iconEnabledColor: Colors.blue,
                                items: years.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(value),
                                      ));
                                }).toList(),
                                onChanged: (String? value) {
                                  yearValue = value;
                                },
                              )),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                            labelText: 'email',
                            helperText: '*required',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'this field can not be empty';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child:
                              Text('password', style: TextStyle(fontSize: 20)),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: 'password',
                                    helperText: '*required',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'this fild can not be emity';
                                  }
                                  return null;
                                },
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child:
                              Text('password', style: TextStyle(fontSize: 20)),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    labelText: 'confirm password',
                                    helperText: '*required',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'this field can not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              child: const Text('Forgot your password?',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    maximumSize: const Size(150, 50),
                                    minimumSize: const Size(150, 50),
                                    //padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                child: const Text(
                                  'signup',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  focusNode.requestFocus();
                                  // print('hello world');
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    //Navigator.of(context).push(_routeHome());
                                  }
                                  _formKey.currentState!.save();
                                },
                              ),
                            )
                          ]),
                    ),

                    const Spacer()
                  ],
                ),
              )),
        ));
  }
}

class Country {
  final String name;
  final Icon flag;
  Country({required this.name, required this.flag});
}
