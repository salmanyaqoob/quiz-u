import 'package:flutter/material.dart';
import 'package:quiz_u/app/routes/routes_manager.dart';

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
    return MaterialApp(
      title: 'Quiz u',
      theme: ThemeData(
          primaryColor: Colors.black, brightness: Brightness.light),
      darkTheme: null,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: buildNamedRoutes(),
    );
  }
}