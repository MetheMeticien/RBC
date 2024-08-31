import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? password;
  final String? address;
  final String? DOB;
  final String? bloodGroup;

  const UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.address,
    required this.DOB,
    required this.bloodGroup,
  });

  toJson() {
    return {
      "FullName": name,
      "Phone": phone,
      "Password": password,
      "Address": address,
      "DOB": DOB,
      "BloodGroup": bloodGroup,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        name: data["FullName"],
        phone: data["Phone"],
        password: data["Password"],
        address: data["Address"],
        DOB: data["DOB"],
        bloodGroup: data["BloodGroup"]);
  }
}
