import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/login/login.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameScreenStateful(
      title: "Enter Name",
    );
  }
}

class NameScreenStateful extends StatefulWidget {
  NameScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(0, 100, 0, 100),
            width: double.infinity,
            height: MediaQuery.of(context).size.height-200,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Quiz U ⏳",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "What's your name?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                      ),
                    ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black87,
                        backgroundColor: Colors.grey,
                        minimumSize: Size(88, 46),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        ),
                      ),
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return LoginScreen();
                            }))
                      },
                      child: Text('Done'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
