import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/models/user_model.dart';
import 'package:rofs_blood_connect/src/features/dashboard/screens/dashboard.dart';
import 'package:rofs_blood_connect/src/repository/user_repo/user_repo.dart';

import '../../../../repository/authentication_repo/authentication.dart';

class UserDetailsController extends GetxController {
  static UserDetailsController get instance => Get.find();

  // Controllers for text fields
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable variable for selected blood group
  final selectedBloodGroup = ''.obs;

  // Observable variable for selected date of birth
  final dateOfBirth = DateTime.now().obs;

  // Method to set blood group
  void setBloodGroup(String group) {
    selectedBloodGroup.value = group;
  }

  // Method to set date of birth
  void setDateOfBirth(DateTime date) {
    dateOfBirth.value = date;
  }

  void printDetails() {
    print("Full Name: ${fullNameController.text}");
    print("Address: ${addressController.text}");
    print("Blood Group: ${selectedBloodGroup.value}");
    print("Date of Birth: ${dateOfBirth.value}");
    print("Password: ${passwordController.text}");
  }

  void addUserInfo() {
    User? current_user = AuthenticationRepository.instance.getCurrentUser();

    if (current_user != null) {
      // User is logged in, create user model
      final user = UserModel(
        name: fullNameController.text,
        phone: current_user.phoneNumber,
        password: passwordController.text,
        address: addressController.text,
        DOB: dateOfBirth.value.toIso8601String(), // Convert DateTime to String
        bloodGroup: selectedBloodGroup.value,
      );

      if (kDebugMode) {
        print("Full Name: ${user.name}");
        print("Phone: ${user.phone}");
        print("Address: ${user.address}");
        print("Blood Group: ${user.bloodGroup}");
        print("Date of Birth: ${user.DOB}");
        print("Password: ${user.password}");
      }
      UserRepository.instance.createUser(user);
      Get.offAll(()=>DashboardPage());

      // Continue with saving user info or other logic

    } else {
      // No user is logged in
      print('No user is currently logged in.');
    }
  }
  // Clean up controllers when not needed
  @override
  void onClose() {
    fullNameController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
