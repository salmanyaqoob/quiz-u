
import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/name/name.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';

Map<String, WidgetBuilder> buildNamedRoutes() {
  Map<String, WidgetBuilder> namedRoutes = {
    //'/': (BuildContext context) => HomePage(),
    '/': (BuildContext context) => LoginScreen(),
    '/otp': (BuildContext context) => OtpScreen(),
    '/enter_name': (BuildContext context) => NameScreen(),
  };

  return namedRoutes;
}