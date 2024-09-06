import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rofs_blood_connect/src/repository/user_repo/user_repo.dart';

import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {


  var fullName = 'John Doe'.obs;
  var age = '11'.obs;
  var contact = '01610608881'.obs;
  var address = 'House 71, Road-15\nSector 11, Uttara, Dhaka'.obs;
  var dateOfBirth = '16/09/1982'.obs;
  var bloodGroup = 'AB+'.obs;
  var lastDonated = '02/02/2024'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    UserModel? userModel = await UserRepository.instance.getCurrentUserInfo();

    if (userModel != null) {
      fullName.value = userModel.name.toString() ?? '';
      age.value = calculateAge(userModel.DOB) ?? '';
      contact.value = userModel.phone.toString() ?? '';
      address.value = userModel.address.toString() ?? '';
      dateOfBirth.value = userModel.DOB.toString() ?? '';
      bloodGroup.value = userModel.bloodGroup ?? '';
      // lastDonated.value = userModel.lastDonated ?? '';
    } else {
      if (kDebugMode) {
        print('Failed to fetch user profile');
      }
    }
  }


  String? calculateAge(String? dateOfBirth) {
    if (dateOfBirth == null || dateOfBirth.isEmpty) {
      return null;
    }

    DateTime dob;
    try {
      dob = DateFormat('dd/MM/yyyy').parse(dateOfBirth);
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing date of birth: $e');
      }
      return null;
    }

    DateTime today = DateTime.now();
    int years = today.year - dob.year;
    if (kDebugMode) {
      print(years);
    }
    if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
      years--;
    }
    if (kDebugMode) {
      print(years);
    }

    return years.toString();
  }


  // Observables for profile details

}

