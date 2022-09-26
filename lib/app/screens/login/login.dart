import 'package:flutter/material.dart';
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';

import 'package:quiz_u/app/screens/otp/otp.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Mobile",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  PhoneNumberInput(
                    initialCountry: 'SA',
                    locale: 'en',
                    countryListMode: CountryListMode.bottomSheet,
                    allowPickFromContacts: false,
                    contactsPickerPosition: ContactsPickerPosition.suffix,
                  ),
                ]),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
                backgroundColor: Colors.grey,
                minimumSize: Size(88, 46),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                textStyle: TextStyle(fontSize: 26),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return OtpScreen();
                }))
              },
              child: Text('Start'),
            )
          ],
        ),
      ))),
    );
  }
}
