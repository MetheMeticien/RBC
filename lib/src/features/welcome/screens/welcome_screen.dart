import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/repository/donation_repo/donation_repo.dart';

import '../../../repository/authentication_repo/authentication.dart';
import '../../../repository/user_repo/user_repo.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final authRepo = Get.put(AuthenticationRepository());
  final userRepo = Get.put(UserRepository());
  final donationRepo = Get.put(DonationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Image.asset('assets/welcome_logo.png'),
      )),
    );
  }
}
