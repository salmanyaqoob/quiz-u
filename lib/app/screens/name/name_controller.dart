import 'package:get/get.dart';
import 'package:quiz_u/app/data/model/NameResponse.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';
import 'package:get_storage/get_storage.dart';

class NameController extends GetxController {
  var name = "".obs;

  void updateName(var name) {
    this.name.value = name;
  }
  void submitName() async {
    if(name.value.isEmpty || name.value.length <=3){
      Get.snackbar("Error", "Name must be minimum 3 characters");
      return;
    }

    String? token = SharedPreferences().getToken();
    NameResponse? nameResponse = await ApiService().updateUserName(name.value, token);
    if (nameResponse != null && nameResponse.success) {
      final AppController appController = Get.find();
      appController.updateName(name.value);
      appController.updateMobile(nameResponse.mobile);
      Get.to(HomeScreen(), routeName: "/home");
    } else {
      if(nameResponse != null) Get.snackbar("Error", nameResponse.message);
    }
  }
}
