import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/auth_controller.dart';

class SocialLogins extends StatelessWidget {
  SocialLogins({
    super.key,
    required this.appleLoginOnTap,
    required this.googleLoginOnTap,
  });
  final VoidCallback googleLoginOnTap;
  final VoidCallback appleLoginOnTap;
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: googleLoginOnTap,
          child: Container(
            width: Adaptive.px(153),
            height: Adaptive.px(60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Obx(
                () => authController.isGoogleSignin.value
                    ? const CircularProgressIndicator(
                        color: ColorClass.primaryColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconClass.google),
                          const SizedBox(width: 10),
                          Text(
                            'Google',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff080C2F)),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: appleLoginOnTap,
          child: Container(
            width: Adaptive.px(153),
            height: Adaptive.px(60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apple,
                  size: Adaptive.h(4),
                ),
                const SizedBox(width: 10),
                Text(
                  'Apple',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff080C2F)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
