import 'package:get/get.dart';
import 'package:quiz_u/app/data/model/UserInfo.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/login/login_bindings.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  var name = "".obs;
  var mobile = "".obs;

  void updateName(var name) {
    this.name.value = name;
  }
  updateMobile(var mobile) {
    this.mobile.value = mobile;
  }

  Future<String> validateToken() async {
    String route = 'login';
    String? token = SharedPreferences().getToken();
    print("token $token");
    if (token == null) {
      route = 'login';
    } else {
      TokenResponse? tokenResponse =
      await ApiService().validateRemoteToken(token);
      print("tokenResponse ${tokenResponseToJson(tokenResponse)}");
      if (tokenResponse != null && tokenResponse.success) {
        UserInfo? userInfo = await ApiService().getUserInfo(token);
        if(userInfo != null){
          name.value = userInfo.name;
          mobile.value = userInfo.mobile;
        }
        route = 'home';
      } else {
        route = 'login';
        //Get.snackbar("Error", tokenResponse.message);
      }
    }
    return route;
  }

  void logout(){
    updateName("");
    updateMobile("");
    SharedPreferences().deleteToken();
    Get.offAll(LoginScreen(), binding: LoginBinding(), routeName: "/login");
  }
}
