import 'package:flutter/material.dart';

import '../../../common_widgets/screens/drawer.dart';
import '../../../common_widgets/screens/navbar.dart';
import '../controllers/profile_controller.dart';
import 'package:get/get.dart';

import 'edit_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

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
                  const Center(child: Text("My Profile")),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => EditProfilePage());
                    },
                    child: const Text("Edit"),
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                        controller.fullName.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Obx(() => Text(
                        controller.bloodGroup.value,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const Text(
                        'Last donated on:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Obx(() => Text(
                        controller.lastDonated.value,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )),
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
                    children: [
                      Obx(() => ProfileDetailRow(
                        label: 'Full Name',
                        value: controller.fullName.value,
                      )),
                      Obx(() => ProfileDetailRow(
                        label: 'Age',
                        value: controller.age.value,
                      )),
                      Obx(() => ProfileDetailRow(
                        label: 'Contact',
                        value: controller.contact.value,
                      )),
                      Obx(() => ProfileDetailRow(
                        label: 'Address',
                        value: controller.address.value,
                      )),
                      Obx(() => ProfileDetailRow(
                        label: 'Date of Birth',
                        value: controller.dateOfBirth.value,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
