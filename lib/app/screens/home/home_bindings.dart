import'package:get/get.dart';
import 'package:quiz_u/app/screens/home/home_controller.dart';

import '../splash/app_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(() => AppController());
  }

}