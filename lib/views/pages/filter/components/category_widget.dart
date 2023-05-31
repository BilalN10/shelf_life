import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/controllers/product_controller.dart';
import 'package:shelf_life/models/category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 14,
      spacing: 14,
      children: List.generate(
        categoryList.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              if (productController.filterProductName.length >= 10 &&
                  !categoryList[index].isCategorySelect) {
                Get.snackbar(
                    'Limit exceeded', 'You can select maximum 10 products');
              } else {
                categoryList[index].isCategorySelect =
                    !categoryList[index].isCategorySelect;

                if (categoryList[index].isCategorySelect) {
                  productController.filterProductName
                      .add(categoryList[index].title);

                  print(
                      'country add list is ${productController.filterProductName.length}  ${productController.filterProductName}');
                } else {
                  productController.filterProductName.removeWhere(
                      (element) => element == categoryList[index].title);
                  print(
                      'country add list is ${productController.filterProductName.length}  ${productController.filterProductName}');
                }
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
            decoration: BoxDecoration(
              color: categoryList[index].isCategorySelect
                  ? const Color(0xff3DB649).withOpacity(.05)
                  : const Color(0xffF4F3F3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              categoryList[index].title,
              style: GoogleFonts.poppins(
                  fontSize: Adaptive.px(15),
                  fontWeight: FontWeight.w500,
                  color: categoryList[index].isCategorySelect
                      ? ColorClass.lightPrimaryColor
                      : const Color(0xff222222)),
            ),
          ),
        ),
      ),
    );
  }
}
