import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:quiz_u/app/screens/login/login_controller.dart';
import 'package:quiz_u/app/screens/name/name.dart';
import 'package:quiz_u/app/screens/otp/otp_controller.dart';

class OtpScreen extends GetView<OtpController> {
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                            children: <Widget>[
                              Text(
                                "Please Enter the OTP send to your mobile ${loginController.mobile_number}", //
                                textAlign: TextAlign.start,
                                style: const TextStyle(
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
                                  onChanged: (pin) {
                                    print("Changed: " + pin);
                                    controller.updateOtpNumber(pin);
                                  },
                                  onCompleted: (pin) {
                                    print("Completed: " + pin);
                                    controller.updateOtpNumber(pin);
                                  }),
                            ]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Theme.of(context).buttonColor,
                                minimumSize: Size(88, 46),
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                textStyle: TextStyle(fontSize: 26),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                ),
                              ),
                              onPressed: () async =>
                              {
                                if(controller.validateOtpNumber()){
                                  controller.loginUser()
                                }
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (BuildContext context) {
                                //       return NameScreen();
                                //     }))
                              },
                              child: Text('Check'),
                            )
                          ],
                        ),
                      ],
                    ))))
    );
  }
}
