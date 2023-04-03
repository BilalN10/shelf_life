import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({
    super.key,
  });

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  double value = 0.4;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          thumbColor: ColorClass.lightPrimaryColor,
          activeColor: ColorClass.lightPrimaryColor,
          inactiveColor: const Color(0xffF5F5F5),
          value: value,
          onChanged: (onChanged) {
            setState(() {
              value = onChanged;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Under \$5',
                style: GoogleFonts.poppins(
                  fontSize: Adaptive.px(10),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222222),
                ),
              ),
              Text(
                '\$50',
                style: GoogleFonts.poppins(
                  fontSize: Adaptive.px(10),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222222),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
