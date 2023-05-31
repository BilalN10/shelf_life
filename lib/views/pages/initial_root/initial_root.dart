import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/views/pages/authentication/login_page.dart';
import 'package:shelf_life/views/pages/bottom_nav/bottom_nav_page.dart';
import 'package:shelf_life/views/pages/splash/splash_page.dart';

class InitialRoot extends StatelessWidget {
  const InitialRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) {
        Get.put<AuthController>(AuthController());
      },
      builder: (_) {
        if (Get.find<AuthController>().firebaseUser.value != null) {
          print('if call');
          return const BottomNavPage();
        } else {
          print('else call');
          return const SplashPage();
        }
      },
    );
  }
}
