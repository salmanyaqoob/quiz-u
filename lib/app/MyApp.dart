import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/routes/routes_manager.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/login/login_bindings.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';
import 'package:quiz_u/app/screens/otp/otp_bindings.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz u',
      theme: ThemeData(
          primaryColor: Colors.black, brightness: Brightness.light),
      darkTheme: null,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //routes: buildNamedRoutes(),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen(), binding: LoginBinding()),
        GetPage(name: '/', page: () => OtpScreen(), binding: OtpBinding()),
      ],
    );
  }
}