import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/otp/otp_page.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/sign_up/screens/register_page.dart';
import 'package:rofs_blood_connect/src/features/dashboard/screens/dashboard.dart';
import 'package:rofs_blood_connect/src/repository/user_repo/user_repo.dart';

import '../../features/authentication/screens/sign_up/screens/user_details_screen.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;



  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    
  }

  User? getCurrentUser() {
    // Get the currently logged-in user
    return _auth.currentUser;
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      // Fetch user data or check if the user's profile is complete
      final isProfileComplete = await UserRepository.instance.getCurrentUserInfo();
      if (isProfileComplete != null) {
        Get.offAll(() => const DashboardPage());
      } else {
        Get.offAll(() => const UserDetailsPage());
      }
    } else {
      Get.offAll(() => const RegisterPage());
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken){
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          Get.snackbar('Error!', '${e.code}');
        },
    );

  }

  Future<void> signOUT() async => _auth.signOut();

  Future<bool> verifyOTP(String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }


}
