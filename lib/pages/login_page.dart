import 'package:flutter/material.dart';
import 'package:testing_flutter_create/pages/signup_page.dart';
import 'package:testing_flutter_create/widgets/bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<StatefulWidget> {
  late FocusNode focusNode;
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: LoginPage(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/logo_transparent 2.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: .5,
                  endIndent: 110,
                  indent: 110,
                  color: Colors.red,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _controller,
                    // focusNode: focusNode,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(
                            fontSize: 10, fontStyle: FontStyle.italic),
                        labelText: 'email',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 25, 90, 143)),
                            borderRadius: BorderRadius.circular(50)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 0, 139, 253)),
                            borderRadius: BorderRadius.circular(50)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 0, 139, 253)),
                            borderRadius: BorderRadius.circular(50))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    focusNode: focusNode,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: const Icon(Icons.password),
                        errorStyle: const TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(50)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 0, 139, 253)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 25, 90, 143)),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 0, 139, 253)),
                            borderRadius: BorderRadius.circular(50))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password field can not be empty';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              width: 120,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(100, 50),
                                      maximumSize: const Size(100, 50),
                                      side: const BorderSide(color: Colors.red),
                                      //s backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      primary: Colors.black,
                                      onSurface: Colors.red),
                                  onPressed: () {
                                    Navigator.of(context).push(_routeSignup());
                                  },
                                  child: const Text('sign up')),
                            )),
                        Theme(
                          //i dont know what i did here wraping the elevated button with
                          //Theme but it will probably work we will look into it

                          data: ThemeData(
                              primaryColor: Colors.yellow,
                              primaryColorDark: Colors.yellow[300]),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                maximumSize: const Size(200, 50),
                                primary: Color.fromRGBO(232, 69, 69, 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              focusNode.requestFocus();

                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(_routeHome());
                              }
                              _formKey.currentState!.save();

                              User user =
                                  User(email: email, password: password);
                              print(
                                  'user email: ${user.email} \n user passward: ${user.password}');
                            },
                            child: const Text('login',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('or sign in with',
                          style: TextStyle(color: Colors.red)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.facebook,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.run_circle_rounded,
                                  size: 50,
                                  color: Colors.red,
                                )))
                      ],
                    )
                  ]),
                ),
                //there will be a button that will say fotgor your password
                //there show be some widget here to provide some contact information
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//i know there is alot to learn but i have to continue by clearing out all the information
//i need to know from the button

//for example: Theme , adding action to a button , nabigation between diffrent pages , validating a form , listview and tables , row and column
//the we go ahead and give alots of emphesis to Animation

//GOOD NIGHT G!

//this code below adds an animation when routing or navigating from one page to another

Route _routeSignup() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignupPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _routeHome() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyHomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

//dummy class

class User {
  final String? email;
  final String? password;
  User({required this.email, required this.password});
}
