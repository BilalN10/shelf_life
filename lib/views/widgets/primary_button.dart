import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isGetStartedButton = false,
    this.isDeleteAccount = true,
  });
  final VoidCallback onTap;
  bool isGetStartedButton;
  final String text;
  bool isDeleteAccount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Adaptive.px(60),
        width: Adaptive.w(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: isDeleteAccount
              ? const LinearGradient(
                  colors: [
                    ColorClass.primaryColor,
                    ColorClass.lightPrimaryColor
                  ],
                )
              : const LinearGradient(colors: [
                  Color(0xffF12D2D),
                  Color(0xffF12D2D),
                ]),
        ),
        child: isDeleteAccount
            ? isGetStartedButton
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Started",
                          style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(16),
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  )
                : Center(
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
            : Center(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(16),
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Adaptive.px(60),
        width: Adaptive.w(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff46B848).withOpacity(.17),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: Adaptive.px(16),
                fontWeight: FontWeight.w500,
                color: ColorClass.lightPrimaryColor),
          ),
        ),
      ),
    );
  }
}
