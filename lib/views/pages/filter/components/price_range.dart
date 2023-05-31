import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/controllers/product_controller.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({
    super.key,
  });

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  double value = 0.4;
  RangeValues _values = RangeValues(0.0, 1000);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          activeColor: ColorClass.lightPrimaryColor,
          values: _values,
          min: 0.0,
          max: 1000,
          onChanged: (values) {
            setState(() {
              _values = values;
              productController.minSalary = _values.start;
              productController.maxSalary = _values.end;
            });
          },
        ),
        // Slider(
        //   thumbColor: ColorClass.lightPrimaryColor,
        //   activeColor: ColorClass.lightPrimaryColor,
        //   inactiveColor: const Color(0xffF5F5F5),
        //   value: value,
        //   onChanged: (onChanged) {
        //     setState(() {
        //       value = onChanged;
        //       print('value is $value');
        //     });
        //   },
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Start \$${productController.minSalary.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: Adaptive.px(10),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222222),
                ),
              ),
              Text(
                'End \$${productController.maxSalary.toStringAsFixed(2)}',
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
