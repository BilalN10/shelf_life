import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/product_controller.dart';

class SelectFoodPrefrences extends StatefulWidget {
  const SelectFoodPrefrences({
    super.key,
    required this.category,
  });

  final List<String> category;

  @override
  State<SelectFoodPrefrences> createState() => _SelectFoodPrefrencesState();
}

class _SelectFoodPrefrencesState extends State<SelectFoodPrefrences> {
  String? _selectedPrefrence;

  ProductController productController = Get.put(ProductController());
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
              'Select Food Preferences',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff080C2F),
              ),
            ),
            value: _selectedPrefrence,
            onChanged: (newValue) {
              setState(() {
                _selectedPrefrence = newValue;
                productController.foodPreferance = newValue!;
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
