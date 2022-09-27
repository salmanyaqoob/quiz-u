
import'package:get/get.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';


class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }

}