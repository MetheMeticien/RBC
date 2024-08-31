import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/models/user_model.dart';
import '../../../controllers/enter_info/enter_info.dart';

class UserDetailsForm extends StatelessWidget {
  UserDetailsForm({super.key});

  final controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter Information',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: controller.fullNameController,
          decoration: InputDecoration(
            labelText: 'Full Name',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: controller.addressController,
          decoration: InputDecoration(
            labelText: 'Address',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Obx(() {
          return DropdownButton<String>(
            value: controller.selectedBloodGroup.value.isEmpty
                ? null
                : controller.selectedBloodGroup.value,
            hint: Text('Select Blood Group'),
            items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                .map((group) => DropdownMenuItem(
                      value: group,
                      child: Text(group),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) controller.setBloodGroup(value);
            },
          );
        }),
        SizedBox(
          height: 30,
        ),
        Obx(() {
          return TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              hintText: 'Select your birth date',
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: controller.dateOfBirth.value,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                controller.setDateOfBirth(pickedDate);
              }
            },
            controller: TextEditingController(
              text: '${controller.dateOfBirth.value.toLocal()}'.split(' ')[0],
            ),
          );
        }),
        SizedBox(
          height: 30,
        ),
        TextField(
          controller: controller.passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.addUserInfo();

            },
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
