import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/category_widget.dart';
import 'components/custom_checkbox.dart';
import 'components/price_range.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: Adaptive.h(90),
          width: Adaptive.w(90),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Adaptive.px(16), vertical: Adaptive.px(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Filters',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'Clear',
                        style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(14),
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.px(25)),
                Text(
                  'Preferences',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'Recently Popular',
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'Latest Addition',
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'Most Authoritative User',
                ),
                SizedBox(
                  height: Adaptive.px(20),
                ),
                Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                const CategoryWidget(),
                SizedBox(
                  height: Adaptive.px(20),
                ),
                Text(
                  'Price Range',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const PriceRange(),
                SizedBox(
                  height: Adaptive.px(40),
                ),
                PrimaryButton(
                  onTap: () {},
                  text: 'See Results',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
