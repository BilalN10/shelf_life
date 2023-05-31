import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/views/pages/authentication/login_page.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class LogoutDialog extends StatelessWidget {
  LogoutDialog({
    super.key,
  });
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(.4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Adaptive.px(200),
              width: Adaptive.px(327),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Adaptive.px(40)),
                child: Column(
                  children: [
                    Text(
                      'Log Out',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Text(
                      'Are you sure want to log out? ',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(14),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff080C2F)),
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: Adaptive.px(43),
                            width: Adaptive.px(112),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffE9E9E9)),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.poppins(
                                    fontSize: Adaptive.px(16),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff080C2F)
                                        .withOpacity(.4)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: Adaptive.px(43),
                          width: Adaptive.px(112),
                          child: PrimaryButton(
                            onTap: () {
                              authController.signOut();
                            },
                            text: 'Logout',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
