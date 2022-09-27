import 'package:get/get.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {

  Future<String> validateToken() async {
    String route = 'login';
    await GetStorage.init('MyStorage');
    //String? token = await SharedPreferences().getToken();
    String? token = GetStorage().read("token");
    print("token $token");
    if (token == null) {
      route = 'login';
    } else {
      print("token $token");
      TokenResponse? tokenResponse =
      await ApiService().validateRemoteToken(token);
      print("tokenResponse ${tokenResponseToJson(tokenResponse)}");
      if (tokenResponse != null && tokenResponse.success) {
        if (tokenResponse.name == null) {
          route = 'name';
        } else {
          route = 'home';
        }
      } else {
        route = 'login';
        //Get.snackbar("Error", tokenResponse.message);
      }
    }
    return route;
  }
}
