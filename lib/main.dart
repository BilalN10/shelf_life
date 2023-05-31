import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/views/pages/initial_root/initial_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shelf_life/bindings/auth_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//9a863ec3-8b4f-42fd-abc2-267b81e31dd3

  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    authController.configOneSignel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          initialBinding: AuthBinding(),
          debugShowCheckedModeBanner: false,
          home: const InitialRoot(),
        );
      },
    );
  }
}
