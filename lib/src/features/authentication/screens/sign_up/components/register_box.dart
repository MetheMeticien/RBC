import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/controllers/signup/signup_controller.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/otp/otp_page.dart';
import '../../../controllers/signup/validators.dart';

class RegisterBox extends StatefulWidget {
  const RegisterBox({super.key});

  @override
  State<RegisterBox> createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: validatePhoneNo,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[900],
                    padding: const EdgeInsets.all(16), // Set padding
                    fixedSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Border radius for the button
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a success message.
                      SignUpController.instance.registerUser(controller.phoneNumber.text.trim());
                      Get.to(const OtpPage());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted successfully!')),
                      );

                      print('Phone No: ${controller.phoneNumber.text}');
                    } else {
                      // If the form is invalid, display a failure message or handle errors.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please correct the errors in the form')),
                      );
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),

                ),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Text('Go to OTP Screen'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpPage()));
                  },
                )
              ],
            ),
          )),
    );
  }
}
