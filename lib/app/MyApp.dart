import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/routes/routes_manager.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:quiz_u/app/screens/home/home_bindings.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/login/login_bindings.dart';
import 'package:quiz_u/app/screens/name/name.dart';
import 'package:quiz_u/app/screens/name/name_bindings.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';
import 'package:quiz_u/app/screens/otp/otp_bindings.dart';
import 'package:quiz_u/app/screens/quiz/quiz.dart';
import 'package:quiz_u/app/screens/quiz/quiz_bindings.dart';
import 'package:quiz_u/app/screens/splash/splash.dart';
import 'package:quiz_u/app/screens/splash/app_bindings.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_u/app/screens/splash/splash_bindings.dart';

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
          primaryColor: Colors.black,
          brightness: Brightness.light,
          backgroundColor: Colors.lightBlue,
          buttonColor: Colors.blue.shade900,
          appBarTheme: AppBarTheme(backgroundColor: Colors.blueAccent),
          bottomAppBarColor: Colors.blueAccent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.blueAccent,
              unselectedItemColor: Colors.grey.shade900, selectedItemColor: Colors.white),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.deepPurple,
            textTheme: ButtonTextTheme.primary,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue.shade900,
            minimumSize: Size(88, 46),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            textStyle: TextStyle(fontSize: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
          ))),

      darkTheme: null,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.onlyBuilder,
      //routes: buildNamedRoutes(),
      getPages: [
        GetPage(name: '/', page: () => SplashView(), binding: SplashBinding()),
        GetPage(
            name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
        GetPage(name: '/otp', page: () => OtpScreen(), binding: OtpBinding()),
        GetPage(
            name: '/name', page: () => NameScreen(), binding: NameBinding()),
        GetPage(
            name: '/home', page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(
            name: '/quiz', page: () => QuizScreen(), binding: QuizBinding()),
      ],
    );
  }
}
