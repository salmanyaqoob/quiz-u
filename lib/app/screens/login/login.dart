import 'package:flutter/material.dart';
import 'package:phone_number/phone_number.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreenStateful(
      title: "Login",
    );
  }
}

class LoginScreenStateful extends StatefulWidget {
  LoginScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenStateful> {
  @override
  Widget build(BuildContext context) {
    // Widget generateButton(String title, Object any) {
    //   return SizedBox(
    //     width: double.infinity,
    //     child: RaisedButton(
    //       child: new Text(
    //         title,
    //       ),
    //       onPressed: any == null
    //           ? null
    //           : () => {
    //         Navigator.push(context,
    //             MaterialPageRoute(builder: (BuildContext context) {
    //               return any;
    //             }))
    //       },
    //       color: Color.fromRGBO(35, 151, 239, 1),
    //       textColor: Color.fromRGBO(255, 255, 255, 1),
    //     ),
    //   );
    // }

    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Quiz U ⏳",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 120,
              ),
              const Text(
                "Mobile",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "500000",
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
              ),
              Container(
                height: 50,
              ),
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
                    child: Text('Start'),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
