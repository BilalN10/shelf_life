import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/controllers/product_controller.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/category_widget.dart';
import 'components/custom_checkbox.dart';
import 'components/price_range.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    // productController.filterProductName.clear();
    //  productController.maxSalary == 0.0;
    // productController.minSalary == 0.0;

    super.initState();
  }

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
                      'add_Filters'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        'clear'.tr,
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
                  'preferences'.tr,
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'recently_Popular'.tr,
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'latest_Addition'.tr,
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                CustomCheckBox(
                  title: 'most_authoritative_user'.tr,
                ),
                SizedBox(
                  height: Adaptive.px(20),
                ),
                Text(
                  'categories'.tr,
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
                  'price_range'.tr,
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
                  onTap: () {
                    if (productController.filterProductName.isEmpty) {
                      Get.snackbar(
                          'food_not_selected'.tr, 'please_select_food'.tr);
                    } else {
                      productController.getFilterProduct().then((value) {
                        Get.back();
                      });
                    }
                  },
                  text: 'see_Results'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
