
import'package:get/get.dart';
import 'package:quiz_u/app/screens/name/name_controller.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';


class NameBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NameController>(() => NameController());
  }

}