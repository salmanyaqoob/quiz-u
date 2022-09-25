
import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/login/login.dart';

Map<String, WidgetBuilder> buildNamedRoutes() {
  Map<String, WidgetBuilder> namedRoutes = {
    //'/': (BuildContext context) => HomePage(),
    '/': (BuildContext context) => LoginScreen(),
  };

  return namedRoutes;
}