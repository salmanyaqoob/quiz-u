import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class SharedPreferences{
  void saveToken(var token){
    GetStorage().write("token", token);
  }

  String? getToken() {
    return GetStorage().read("token");
  }

  void deleteToken(){
    GetStorage().remove("token");
  }

  bool? getFirstTimeOpen() {
    return GetStorage().read("first");
  }

  void setFirstTimeOpen() {
    GetStorage().write("first", true);
  }
}