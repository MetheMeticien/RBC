import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/otp_box.dart';
import 'package:rofs_blood_connect/src/features/authentication/controllers/otp/otp_controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  void initState() {
    super.initState();
    Get.put(OTPController()); // Initialize the OTPController here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: OTPBox(),
        ),
      ),
    );
  }
}
