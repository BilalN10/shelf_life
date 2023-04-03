import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    super.key,
    required this.category,
  });

  final List<String> category;

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? _selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      width: Adaptive.w(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(11)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Image.asset(IconClass.arrowDown),
            hint: Text(
              'Select Category',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff080C2F),
              ),
            ),
            value: _selectedCategory,
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
            items: widget.category.map((categories) {
              return DropdownMenuItem(
                value: categories,
                child: Text(
                  categories,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff080C2F),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
