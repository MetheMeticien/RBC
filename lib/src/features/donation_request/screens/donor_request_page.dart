import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/request_controller.dart';
import '../../../common_widgets/screens/drawer.dart';
import '../../../common_widgets/screens/navbar.dart';

class DonorRequestPage extends StatelessWidget {
  const DonorRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DonorRequestController controller = Get.put(DonorRequestController());

    return Scaffold(
      appBar: RBCAppbar(),
      endDrawer: RBCDrawer(),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Make a Donation Request',
                  style: TextStyle(fontSize: 23),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedDistrict.value.isEmpty
                          ? null
                          : controller.selectedDistrict.value,
                      decoration: InputDecoration(
                        labelText: 'District',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>[
                        'District 1',
                        'District 2',
                        'District 3'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.selectedDistrict.value = newValue ?? '';
                      },
                    )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedArea.value.isEmpty
                          ? null
                          : controller.selectedArea.value,
                      decoration: InputDecoration(
                        labelText: 'Area',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>['Mohammadpur', 'Mirpur', 'Sylhet']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.selectedArea.value = newValue ?? '';
                      },
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedHospital.value.isEmpty
                          ? null
                          : controller.selectedHospital.value,
                      decoration: InputDecoration(
                        labelText: 'Name of Hospital',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>[
                        'Hospital 1',
                        'Hospital 2',
                        'Hospital 3'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.selectedHospital.value = newValue ?? '';
                      },
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedNumBags.value.isEmpty
                          ? null
                          : controller.selectedNumBags.value,
                      decoration: InputDecoration(
                        labelText: 'Number of bags',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>['1', '2', '3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.selectedNumBags.value = newValue ?? '';
                      },
                    )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Obx(() => DropdownButtonFormField<String>(
                      value: controller.selectedBloodType.value.isEmpty
                          ? null
                          : controller.selectedBloodType.value,
                      decoration: InputDecoration(
                        labelText: 'Blood Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: <String>['AB+', 'O-', 'B+']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        controller.selectedBloodType.value = newValue ?? '';
                      },
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Details of the patient',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  controller.patientDetails.value = value;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Blood required on:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.setUrgency(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: controller
                                          .bloodRequirementUrgency.value
                                          ? Colors.black
                                          : Colors.grey,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Urgent',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final DateTime? picked =
                                      await showDatePicker(
                                        context: context,
                                        initialDate:
                                        controller.selectedDate.value,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2101),
                                      );
                                      if (picked != null &&
                                          picked !=
                                              controller
                                                  .selectedDate.value) {
                                        controller.setSelectedDate(picked);
                                        controller.setUrgency(false);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Select date',
                                      style: TextStyle(
                                        color: controller
                                            .bloodRequirementUrgency
                                            .value
                                            ? Colors.black38
                                            : Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   // backgroundColor: Colors.red[200],
                  // ),
                    onPressed: controller.submitBtnPressed,
                    child: Text('Submit',
                    style: TextStyle(fontSize: 20),)),
              )
            ],
          ),
        ),
      ),)
    );
  }
}
