import 'package:flutter/material.dart';
import 'package:rofs_blood_connect/src/features/donation_request/models/request_model.dart';
import 'package:rofs_blood_connect/src/repository/donation_repo/donation_repo.dart';

import '../../../common_widgets/screens/drawer.dart';
import '../../../common_widgets/screens/navbar.dart';
import 'components/one_req_box.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({super.key});

  @override
  State<RequestsListPage> createState() => _RequestsListPageState();
}

class _RequestsListPageState extends State<RequestsListPage> {
  List<RequestModel> _products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    // Fetch the products asynchronously
    List<RequestModel> products =
        await DonationRepository.instance.getAllRequests();
    // Update the state to reflect the fetched products
    setState(() {
      _products = products;
    });
    // Debugging output to confirm products are fetched
    print(_products.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RBCAppbar(),
      endDrawer: RBCDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(child: Text("Donation Requests",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20),
            // Wrap the ListView.builder in an Expanded widget
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  print(product.hospital.toString());
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      OneReqBox(
                        hospitalName: product.hospital.toString(),
                        location: product.area.toString(),
                        numberOfBags: int.parse(product.noOfBags!),
                        patientDetails: product.details.toString(),
                        requesterContact: product.userPhone.toString(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}
