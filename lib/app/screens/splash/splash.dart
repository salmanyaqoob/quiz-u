import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:quiz_u/app/screens/home/home_bindings.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/login/login_bindings.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';
import 'package:quiz_u/app/screens/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView() {
    print("SplashView loaded");
    futureCall();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                "Quiz U",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Image.asset('assets/images/timer.png', height: 150),
              const CircularProgressIndicator(color: Colors.white,)
            ],
          ),
        ))));
  }

    void futureCall() async {
      final AppController appController = Get.find();
    // do async operation ( api call, auto login)
    String route = await appController.validateToken();

    if (route == 'login') {
      Get.off(LoginScreen(), binding: LoginBinding(), routeName: "/login");
    } else {
      //Get.offNamed("/");
      Get.off(HomeScreen(), binding: HomeBinding(), routeName: "/home");
    }
  }
}
