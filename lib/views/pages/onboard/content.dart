import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Adaptive.h(2)),
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        SizedBox(height: Adaptive.h(2)),
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: Adaptive.px(24),
                fontWeight: FontWeight.w600,
                color: ColorClass.lightPrimaryColor)),
        SizedBox(height: Adaptive.h(2)),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: Adaptive.px(14),
            fontWeight: FontWeight.w400,
            color: const Color(0xff080C2F).withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
