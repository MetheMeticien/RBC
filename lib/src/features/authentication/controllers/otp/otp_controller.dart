import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/dashboard/screens/dashboard.dart';
import 'package:rofs_blood_connect/src/repository/authentication_repo/authentication.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  var otp = ''.obs;

  void setOtp(String code) {
    otp.value = code;
  }

  void verifyOTP() async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp.value);
    if (isVerified) {
      // Get.offAll(() => const DashboardPage());
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }
}
