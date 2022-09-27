import 'package:get/get.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';
import 'package:quiz_u/app/data/request/login_request.dart';
import 'package:quiz_u/app/screens/name/name.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/LoginResponse.dart';
import '../login/login_controller.dart';

class OtpController extends GetxController {
  var otp_number = "".obs;

  void updateOtpNumber(var number) {
    otp_number.value = number;
  }

  bool validateOtpNumber(){
    String otpNumber = otp_number.value;
    bool isValid = false;
    if(!otpNumber.isEmpty){
      isValid = true;
    }
    if(otpNumber.length == 4){
      isValid = true;
    }
    if(otpNumber.length < 4){
      isValid = false;
    }
    if(!isValid){
      Get.snackbar("OTP number", "Please complete the OTP");
    }
    return isValid;
  }

  void loginUser() async{
    final LoginController loginController = Get.find();
    String mobileNumber = loginController.mobile_number.value;
    LoginRequest loginRequest = LoginRequest(otp: otp_number.value, mobile: mobileNumber);
    LoginResponse? loginResponse = await ApiService().loginUser(loginRequest);
    print("loginResponse ${loginResponse?.toJson()}");
    if(loginResponse!.success){
      SharedPreferences().saveToken(loginResponse.token);
      if((loginResponse.userStatus != null && loginResponse.userStatus == "new") || (loginResponse.name == null)){
        Get.to(NameScreen());
      }
    } else {
      Get.snackbar("Error", loginResponse.message);
    }
  }


}
