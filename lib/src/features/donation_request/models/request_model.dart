import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  final String? id;
  final String? userPhone;
  final String? district;
  final String? area;
  final String? hospital;
  final String? noOfBags;
  final String? bloodGroup;
  final String? details;
  final String? urgency;
  final DateTime? date;

  const RequestModel({
    this.id,
    required this.userPhone,
    required this.district,
    required this.area,
    required this.hospital,
    required this.noOfBags,
    required this.bloodGroup,
    required this.details,
    required this.urgency,
    required this.date,
  });

  toJson() {
    return {
      "UserPhone": userPhone,
      "District": district,
      "Area": area,
      "Hospital": hospital,
      "NoOfBags": noOfBags,
      "BloodGroup": bloodGroup,
      "Details": details,
      "Urgency": urgency,
      "Date": date.toString(),
    };
  }

  factory RequestModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RequestModel(
      id: document.id,
      userPhone: data["BloodGroup"],
      district: data["District"],
      area: data["Area"],
      hospital: data["Hospital"],
      noOfBags: data["NoOfBags"],
      bloodGroup: data["BloodGroup"],
      details: data["Details"],
      urgency: data["Urgency"],
      date: DateTime.parse(data["Date"]),
    );
  }
}
