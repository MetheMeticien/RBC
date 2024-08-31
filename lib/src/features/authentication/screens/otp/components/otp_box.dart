import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/controllers/otp/otp_controller.dart';

class OTPBox extends StatelessWidget {
  OTPBox({super.key});

  final otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Enter OTP to verify',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          OtpTextField(
            keyboardType: TextInputType.number,
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            showFieldAsBox: true,
            autoFocus: true,
            onCodeChanged: (code){
              if(code.isNotEmpty && code.length ==6){
                otpController.setOtp(code);
                otpController.verifyOTP();
              }
            },
            onSubmit: (code) {
              otpController.setOtp(code);
              otpController.verifyOTP();
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              padding: const EdgeInsets.all(16),
              fixedSize: const Size(100, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              otpController.verifyOTP();
            },
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            child: const Text('Go to OTP Screen'),
            onTap: () {
              // Navigation code here, if needed
            },
          ),
        ],
      ),
    );
  }


}
