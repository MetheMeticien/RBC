import 'package:flutter/material.dart';

class OneReqBox extends StatefulWidget implements PreferredSizeWidget {
  final String hospitalName;
  final String location;
  final int numberOfBags;
  final String patientDetails;
  final String requesterContact;

  OneReqBox({super.key,
    required this.hospitalName,
    required this.location,
    required this.numberOfBags,
    required this.patientDetails,
    required this.requesterContact,
  });

  @override
  State<OneReqBox> createState() => _OneReqBoxState();

  @override
  Size get preferredSize => const Size.fromHeight(80); // Adjusted default height
}

class _OneReqBoxState extends State<OneReqBox> {
  double boxHeight = 80;

  void changeBoxHeight() {
    setState(() {
      boxHeight = boxHeight < 100 ? 220 : 80;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBoxHeight,
      child: AnimatedContainer(
        height: boxHeight,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        duration: const Duration(milliseconds: 200),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hospitalName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.location,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.numberOfBags}',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          const TextSpan(
                            text: ' bags',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Text(
                'Patient Details:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  widget.patientDetails,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Request made by: ${widget.requesterContact}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 13),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      padding: EdgeInsets.all(0),
                      fixedSize: const Size(100, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Donate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(boxHeight); // Dynamically returning the height based on box height
}
