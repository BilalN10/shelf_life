import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedBackContainer extends StatelessWidget {
  const FeedBackContainer({
    super.key,
    required this.image,
    required this.colors,
    required this.title,
    required this.textColor,
  });
  final String image;
  final List<Color> colors;
  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.px(65),
      width: Adaptive.px(100),
      child: Column(
        children: [
          Container(
            height: Adaptive.px(44),
            width: Adaptive.px(44),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage(image)),
              gradient: RadialGradient(
                colors: colors,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: Adaptive.px(10),
                fontWeight: FontWeight.w600,
                color: textColor),
          ),
        ],
      ),
    );
  }
}
