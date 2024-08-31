import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/models/user_model.dart';

import '../authentication_repo/authentication.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.phone)
        .set(user.toJson())
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

  updateUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(user.phone)
        .update(user.toJson())
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

  Future<UserModel?> getCurrentUserInfo() async {
    User? currentUser = AuthenticationRepository.instance.getCurrentUser();

    if (currentUser == null) {
      return null;
    }

    final snapshot = await _db
        .collection('Users')
        .where("Phone", isEqualTo: currentUser.phoneNumber)
        .get();

    if (snapshot.docs.isEmpty) {
      if (kDebugMode) {
        print('No such field found');
      }
      return null;
    }

    final userdata = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userdata;
  }
}
