
import'package:get/get.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';
import 'package:quiz_u/app/screens/splash/splash_controller.dart';


class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}