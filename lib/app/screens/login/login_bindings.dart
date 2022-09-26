
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}