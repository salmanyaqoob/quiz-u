import 'package:flutter/material.dart';
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:quiz_u/app/screens/login/login_controller.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/otp/otp_bindings.dart';

class LoginScreen extends GetView<LoginController> {
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Center(
                          //   child: Obx(() => Text("${controller.mobile_number.toString()}")),
                          // ),
                          const Text(
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
                            onChanged: (value) => controller.updateMobileNumber(value),
                            controller: PhoneNumberInputController(context),
                          ),
                        ]),
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
                      onPressed: () async => {
                        if(await controller.validateMyPhoneNumber()){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (BuildContext context) {
                          //       return OtpScreen();
                          //     }))
                        Get.to(OtpScreen(), routeName: "/otp", binding: OtpBinding())
                        }
                      },
                      child: Text('Start'),
                    )
                  ],
                ),
              ))),
    );
  }
}
