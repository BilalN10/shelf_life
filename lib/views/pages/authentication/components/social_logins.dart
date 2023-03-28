import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    super.key,
    required this.appleLoginOnTap,
    required this.googleLoginOnTap,
  });
  final VoidCallback googleLoginOnTap;
  final VoidCallback appleLoginOnTap;
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
            child: Row(
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
