import 'package:get/get.dart';
import 'package:quiz_u/app/data/model/NameResponse.dart';
import 'package:quiz_u/app/data/model/TopScores.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var loadingLeaderBoard = true.obs;
  var selectedIndex = 0.obs;
  var name = "".obs;
  List<TopScores?>? topScores = [new TopScores()].obs as List<TopScores>;

  void updateSelectedIndex(var index) {
    print("index $index");
    selectedIndex.value = index;
  }

  void updateName(var name) {
    this.name.value = name;
  }

  Future<List<TopScores>?> getTopScores() async{
    loadingLeaderBoard.value = true;
    String? token = SharedPreferences().getToken();
    List<TopScores>? topScores = await ApiService().getTopScores(token);

    this.topScores = topScores!;
    loadingLeaderBoard.value = false;
    return topScores;
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
