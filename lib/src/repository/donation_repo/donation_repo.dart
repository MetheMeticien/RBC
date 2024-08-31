import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/models/user_model.dart';
import 'package:rofs_blood_connect/src/features/donation_request/models/request_model.dart';

import '../authentication_repo/authentication.dart';

class DonationRepository extends GetxController {
  static DonationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createNewReq(RequestModel request) async {
    await _db
        .collection("DonationRequests")
        .add(request.toJson())
        .whenComplete(() => Get.snackbar(
      "Success",
      "Your user info has been added",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    ))
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }

  // updateUser(UserModel user) async {
  //   await _db
  //       .collection("DonationRequests")
  //       .doc(user.phone)
  //       .update(user.toJson())
  //       .whenComplete(() => Get.snackbar(
  //     "Success",
  //     "Your user info has been added",
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.green.withOpacity(0.1),
  //     colorText: Colors.green,
  //   ))
  //       .catchError((error, stackTrace) {
  //     Get.snackbar(
  //       "Error",
  //       "Something went wrong",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent.withOpacity(0.1),
  //       colorText: Colors.red,
  //     );
  //     print(error.toString());
  //   });
  // }
  //
  Future<List<RequestModel>> getAllRequests() async {
    final snapshot = await _db.collection('DonationRequests').get();

    if (snapshot.docs.isEmpty) {
      if (kDebugMode) {
        print('No Donation Requests found');
      }
      return [];
    }

    final requests = snapshot.docs.map((e) => RequestModel.fromSnapshot(e)).toList();
    return requests;
  }

}
