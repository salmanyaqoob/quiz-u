import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quiz_u/app/screens/name/name.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OtpScreenStateful(
      title: "Otp",
    );
  }
}

class OtpScreenStateful extends StatefulWidget {
  OtpScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreenStateful> {
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                "Please Enter the OTP send to your mobile",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              OTPTextField(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                length: 4,
                                width: double.infinity,
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldWidth: 45,
                                fieldStyle: FieldStyle.box,
                                outlineBorderRadius: 15,
                                style: TextStyle(fontSize: 17),
                                // onChanged: (pin) {
                                //   print("Changed: " + pin);
                                // },
                                // onCompleted: (pin) {
                                //   print("Completed: " + pin);
                                // }),
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
                                textStyle: TextStyle(fontSize: 26),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0)),
                                ),
                              ),
                              onPressed: () => {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return NameScreen();
                                }))
                              },
                              child: Text('Check'),
                            )
                          ],
                        ),
                      ],
                    )))));
  }
}
