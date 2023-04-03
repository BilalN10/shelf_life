import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/models/select_feature_model.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';

import 'components/category_dropdown.dart';
import 'components/description_field.dart';
import 'components/select_food_prefrence.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final List<String> category = [
    'Garlic Sauce',
    'Sauce',
    'Tomato Sauce',
  ];
  final List<String> categoryPrefrence = [
    'Garlic Sauce',
    'Sauce',
    'Tomato Sauce',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(15),
              right: Adaptive.px(15),
              top: Adaptive.px(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  const Spacer(),
                  Text(
                    'Add Product',
                    style: GoogleFonts.poppins(
                        fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: Adaptive.px(16),
              ),
              CommonField(
                isPrefix: false,
                controller: productNameController,
                keyboardType: TextInputType.name,
                prefixIcon: IconClass.appIcon,
                onChanged: (onChanged) {},
                validator: (validator) {
                  return;
                },
                hintText: 'Product Name',
              ),
              SizedBox(
                height: Adaptive.px(15),
              ),
              CategoryDropDown(category: category),
              SizedBox(
                height: Adaptive.px(15),
              ),
              SelectFoodPrefrences(category: category),
              SizedBox(
                height: Adaptive.px(15),
              ),
              DescriptionField(
                controller: descriptionController,
                validator: (value) {
                  return;
                },
              ),
              SizedBox(height: Adaptive.px(15)),
              Text(
                'Select Features',
                style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: Adaptive.h(20),
                width: Adaptive.w(100),
                child: GridView.builder(
                  itemCount: selectFeatureList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / .3,
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectFeatureList[index].value =
                                  !selectFeatureList[index].value;
                            });
                          },
                          child: Container(
                            height: Adaptive.px(16),
                            width: Adaptive.px(16),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: const Color(0xff000000),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.done,
                                size: 12,
                                color: selectFeatureList[index].value
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: Adaptive.px(43),
                          width: Adaptive.px(43),
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: selectFeatureList[index].value
                                  ? selectFeatureList[index].colors
                                  : [
                                      const Color(0xffC9FFEB).withOpacity(.54),
                                      const Color(0xffC9FFEB).withOpacity(.54),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Image.asset(selectFeatureList[index].value
                                ? selectFeatureList[index].image
                                : selectFeatureList[index].unselectedIcon),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          selectFeatureList[index].name,
                          style: GoogleFonts.poppins(
                              color: selectFeatureList[index].value
                                  ? selectFeatureList[index].iconColor
                                  : const Color(0xff080C2F)),
                        ),
                      ],
                    );
                  },
                ),
              ),
              CommonField(
                isPrefix: false,
                controller: quantityController,
                keyboardType: TextInputType.number,
                prefixIcon: IconClass.appIcon,
                onChanged: (onChanged) {},
                validator: (validator) {
                  return;
                },
                hintText: 'Quantity',
              ),
              SizedBox(height: Adaptive.px(15)),
              Text(
                'Select Price Options:',
                style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
