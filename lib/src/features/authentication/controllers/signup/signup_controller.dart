import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/repository/authentication_repo/authentication.dart';

import '../../screens/otp/otp_page.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final phoneNumber = TextEditingController();


  void registerUser(String phoneNo) {
    String fullPhoneNumber = "+88$phoneNo";
    if (kDebugMode) {
      print(fullPhoneNumber);
    }
    AuthenticationRepository.instance.phoneAuthentication(fullPhoneNumber);
  }
}
