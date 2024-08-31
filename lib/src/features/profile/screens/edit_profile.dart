import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/sign_up/components/enter_info.dart';
import 'package:rofs_blood_connect/src/features/profile/controllers/edit_info_controller.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<EditProfilePage> {

  final controller = Get.put(EditInfoController());


  @override
  void initState() {
    super.initState();
    // Lock screen orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    // Reset screen orientation to allow all orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
        body: SafeArea(child: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(30),
            height: Get.height,
            child: Column(
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
                      controller.updateUserInfo();

                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ))
    );
  }
}