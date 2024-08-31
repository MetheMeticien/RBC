import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/donation_request/models/request_model.dart';
import 'package:rofs_blood_connect/src/repository/donation_repo/donation_repo.dart';

import '../../../repository/authentication_repo/authentication.dart';
import '../../dashboard/screens/dashboard.dart';

class DonorRequestController extends GetxController {
  var selectedDistrict = ''.obs;
  var selectedArea = ''.obs;
  var selectedHospital = ''.obs;
  var selectedNumBags = ''.obs;
  var selectedBloodType = ''.obs;
  var patientDetails = ''.obs;
  var bloodRequirementUrgency = false.obs;
  var selectedDate = DateTime.now().obs;

  // Method to set the blood requirement as urgent
  void setUrgency(bool urgency) {
    bloodRequirementUrgency.value = urgency;
    if(urgency){
      selectedDate.value = DateTime.now();
    }
  }

  // Method to set the selected date
  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void submitBtnPressed()
  {
    if (kDebugMode) {
      print(selectedDistrict.value);
      print(selectedArea.value);
      print(selectedHospital.value);
      print(selectedNumBags.value);
      print(selectedBloodType.value);
      print(patientDetails.value);
      print(bloodRequirementUrgency.value);
      print(selectedDate.value);
    }
    User? current_user = AuthenticationRepository.instance.getCurrentUser();
    if (current_user != null) {
      // User is logged in, create user model
      final request = RequestModel(userPhone: current_user.phoneNumber, district: selectedDistrict.value, area: selectedArea.value, hospital: selectedHospital.value, noOfBags: selectedNumBags.value, bloodGroup: selectedBloodType.value, details: patientDetails.value, urgency: bloodRequirementUrgency.value.toString(), date: selectedDate.value);


      DonationRepository.instance.createNewReq(request);
      Get.offAll(()=>DashboardPage());

      // Continue with saving user info or other logic

    } else {
      // No user is logged in
      print('No user is currently logged in.');
    }

  }
}
