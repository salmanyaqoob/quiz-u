import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class SharedPreferences{
  void saveToken(var token){
    GetStorage().write("token", token);
  }

  Future<String?> getToken() async{
    return await GetStorage().read("token");
  }
}