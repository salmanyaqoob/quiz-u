import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';

class LoginController extends GetxController {
  var mobile_number = "".obs;

  void updateMobileNumber(var number) {
    mobile_number.value = number;
  }

  Future<bool> validateMyPhoneNumber() async {
    String phoneNumber = mobile_number.value;
    // Parsing
    //PhoneNumber phoneNumber = await PhoneNumberUtil().parse(springFieldUSASimple);
    bool isValid = false;
    // Validate
    isValid = await PhoneNumberUtil().validate(phoneNumber);

    if (!isValid) {
      Get.snackbar("Phone number", "${mobile_number.value} number is not valid, Try Again!");
    }
    return isValid;
  }
}
