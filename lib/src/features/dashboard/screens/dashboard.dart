import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../common_widgets/screens/drawer.dart';
import '../../../common_widgets/screens/navbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RBCAppbar(),
      endDrawer: RBCDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/bloodDonation.png'),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Find your blood",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "connection with one tap",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        padding: const EdgeInsets.all(16), // Set padding
                        fixedSize: const Size(300, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Border radius for the button
                        ), // Set size
                      ),
                      child: const Text(
                        'Search for Donor',
                        style: TextStyle(
                            color: Colors.white70,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Active blood donation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "requests for you",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Center(
                  child: Text(
                    "25",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                        padding: const EdgeInsets.all(16), // Set padding
                        fixedSize: const Size(170, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Border radius for the button
                        ), // Set size
                      ),
                      child: const Text(
                        'Donate Blood',
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ),
                const SizedBox(height: 25),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,

                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    DottedBorder(
                      color: Colors.black, // Border color
                      strokeWidth: 1.5, // Width of the border
                      dashPattern: const [
                        10,
                        8
                      ], // Define the pattern of dashes (8 pixels on, 4 pixels off)
                      borderType: BorderType
                          .RRect, // Border type (e.g., rounded rectangle)
                      radius: const Radius.circular(12),
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '49',
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Request Responses',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            // Text(
                            //   'made today',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //   ),
                            // ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.zero, // Set padding
                                  fixedSize: const Size(130, 15),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10), // Border radius for the button
                                  // ),// Set size
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'See details',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(width: 20),

                    DottedBorder(
                      color: Colors.black, // Border color
                      strokeWidth: 1.5, // Width of the border
                      dashPattern: const [
                        10,
                        8
                      ], // Define the pattern of dashes (8 pixels on, 4 pixels off)
                      borderType: BorderType
                          .RRect, // Border type (e.g., rounded rectangle)
                      radius: const Radius.circular(12),
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '200',
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Donations required',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            // Text(
                            //   'made today',
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //   ),
                            // ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.zero, // Set padding
                                  fixedSize: const Size(130, 15),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10), // Border radius for the button
                                  // ),// Set size
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'See details',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
