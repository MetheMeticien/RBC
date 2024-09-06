import 'package:flutter/material.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/sign_up/components/enter_info.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/sign_up/screens/user_details_screen.dart';
import 'package:rofs_blood_connect/src/features/donation_request/screens/components/one_req_box.dart';
import 'package:rofs_blood_connect/src/features/donation_request/screens/requests_list.dart';
import 'package:rofs_blood_connect/src/repository/authentication_repo/authentication.dart';
import 'package:get/get.dart';

import '../../features/dashboard/screens/dashboard.dart';
import '../../features/donation_request/screens/donor_request_page.dart';
import '../../features/profile/screens/profile_page.dart';

class RBCDrawer extends StatelessWidget implements PreferredSizeWidget {
  const RBCDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: Center(
            child: Text(
              "M E N U",
              style: TextStyle(
                fontWeight: FontWeight.bold, // Make the text bold
                fontSize: 24, // Adjust the font size if needed
                // Use a custom font family
                color: Color.fromRGBO(153, 52, 52, 1), // Customize the color
              ),
            ),
          )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.offAll(()=> DashboardPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.browse_gallery),
            title: const Text(
              "Requests",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonorRequestPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.browse_gallery),
            title: const Text(
              "Your Requests",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestsListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.browse_gallery),
            title: const Text(
              "Edit Profile",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(),
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(

            )
              ,onPressed: (){
            AuthenticationRepository.instance.signOUT();
          }, child: Text('Signout',
          style: TextStyle(
            fontSize: 25,

          ),))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
