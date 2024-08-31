import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rofs_blood_connect/src/features/authentication/screens/sign_up/screens/register_page.dart';
import 'package:rofs_blood_connect/src/features/dashboard/screens/dashboard.dart';
import 'package:rofs_blood_connect/src/features/welcome/screens/welcome_screen.dart';
import 'package:rofs_blood_connect/src/repository/authentication_repo/authentication.dart';
import 'package:rofs_blood_connect/src/repository/user_repo/user_repo.dart'; // Import UserRepository
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize repositories
  // Get.put(AuthenticationRepository());
  // Get.put(UserRepository()); // Initialize UserRepository

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WelcomeScreen(),
    );
  }
}