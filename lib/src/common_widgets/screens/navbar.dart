import 'package:flutter/material.dart';

class RBCAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RBCAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage:
                AssetImage('assets/logo.png'), // Use your image asset here
          ),
          SizedBox(width: 8),
          Text(
            "Project RBC",
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 24, // Adjust the font size if needed
              fontFamily: 'Roboto', // Use a custom font family
              color: Color.fromRGBO(153, 52, 52, 1), // Customize the color
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // You can customize the color here
      elevation: 4, // You can customize the elevation
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
