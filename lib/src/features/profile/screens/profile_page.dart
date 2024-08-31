import 'package:flutter/material.dart';

import '../../../common_widgets/screens/drawer.dart';
import '../../../common_widgets/screens/navbar.dart';
import 'package:get/get.dart';

import 'edit_profile.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RBCAppbar(),
      endDrawer: RBCDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Row(
                  children: [
                    Center(child: Text("My Profile"),),
                    ElevatedButton(onPressed: (){
                      Get.to(()=> EditProfilePage());
                    }, child: Text("Edit")),
                  ],
                ),
                const Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Use your image asset here
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mueed Ibne Sami',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'AB+',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Last donated on:',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '02/02/2024',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Have you donated in recent time?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 400,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.red[100],
                    child: ListView(
                      children: const <Widget>[
                        ProfileDetailRow(label: 'Full Name', value: 'John Doe'),
                        ProfileDetailRow(label: 'Age', value: '21'),
                        ProfileDetailRow(
                            label: 'Contact', value: '01610608881'),
                        ProfileDetailRow(
                            label: 'Address',
                            value:
                                'House 71, Road-15\nSector 11, Uttara, Dhaka'),
                        ProfileDetailRow(
                            label: 'Date of Birth', value: '16/09/1982'),
                        ProfileDetailRow(label: 'Gender', value: 'Male'),
                        ProfileDetailRow(
                            label: 'Email Address',
                            value: 'johndoe@example.com'),
                        ProfileDetailRow(label: 'Blood Group', value: 'O+'),
                        ProfileDetailRow(label: 'Rh Factor', value: 'Positive'),
                        ProfileDetailRow(
                            label: 'Medical Conditions', value: 'None'),
                        ProfileDetailRow(
                            label: 'History of Blood Transfusions',
                            value: 'None'),
                        ProfileDetailRow(
                            label: 'Allergies', value: 'Penicillin'),
                        ProfileDetailRow(
                            label: 'Current Medications', value: 'None'),
                        ProfileDetailRow(
                            label: 'Vaccination Status',
                            value: 'Fully vaccinated'),
                        ProfileDetailRow(
                            label: 'Last Donation Date', value: '01/01/2024'),
                        ProfileDetailRow(
                            label: 'Donation Frequency', value: 'Regular'),
                        ProfileDetailRow(
                            label: 'Donation Restrictions', value: 'None'),
                        ProfileDetailRow(
                            label: 'Address',
                            value:
                                'House 71, Road-15\nSector 11, Uttara, Dhaka'),
                        ProfileDetailRow(
                            label: 'Preferred Donation Center',
                            value: 'City Blood Bank'),
                        ProfileDetailRow(
                            label: 'Emergency Contact Name', value: 'Jane Doe'),
                        ProfileDetailRow(
                            label: 'Emergency Contact Phone Number',
                            value: '01911294558'),
                        ProfileDetailRow(
                            label: 'Emergency Contact Relationship',
                            value: 'Spouse'),
                        ProfileDetailRow(
                            label: 'Preferred Days/Times for Donation',
                            value: 'Weekends'),
                        ProfileDetailRow(
                            label: 'Willingness to Travel',
                            value: 'Within 10 km'),
                        ProfileDetailRow(
                            label: 'Donation Preferences',
                            value: 'Whole blood'),
                        ProfileDetailRow(
                            label: 'Notes',
                            value: 'Prefer left arm for donation')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
