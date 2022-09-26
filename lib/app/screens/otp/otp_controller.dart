import 'package:get/get.dart';

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
    return isValid;
  }


}
