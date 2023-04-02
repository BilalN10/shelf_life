import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.image,
    required this.onTap,
    required this.title,
  });
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Adaptive.px(60),
        width: Adaptive.w(100),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                color: const Color(0xff000000),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(14), fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Image.asset(
                IconClass.forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
