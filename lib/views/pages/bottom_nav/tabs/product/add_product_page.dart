import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/models/select_feature_model.dart';
import 'package:shelf_life/views/pages/qr_scanner/qr_code_scanner_page.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

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
  final TextEditingController fixPriceControllerController =
      TextEditingController();
  final TextEditingController eanController = TextEditingController();
  final TextEditingController offerPriceControllerController =
      TextEditingController();
  final TextEditingController discountPriceControllerController =
      TextEditingController();
  final TextEditingController otherPriceControllerController =
      TextEditingController();
  String _inputText = '';

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
  int _selectedIndex = -1;
  final radioText = [
    'Fixed Price',
    'Offer Price',
  ];
  DateTime now = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != now) {
      setState(() {
        now = picked;
      });
    }
  }

  final List<File?> _imageFiles = List.generate(5, (_) => null);

  Future<void> _takePicture(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFiles[index] = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat format = DateFormat('MM-yyyy-dd');
    final String formatted = format.format(now);

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
          child: SingleChildScrollView(
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
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectFeatureList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        const Color(0xffC9FFEB)
                                            .withOpacity(.54),
                                        const Color(0xffC9FFEB)
                                            .withOpacity(.54),
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
                Row(
                  children: List.generate(
                    radioText.length,
                    (index) => Row(
                      children: [
                        Radio(
                          value: index,
                          groupValue: _selectedIndex,
                          onChanged: (value) {
                            setState(() {
                              _selectedIndex = value!;
                            });
                          },
                        ),
                        Text(
                          radioText[index],
                        ),
                      ],
                    ),
                  ),
                ),
                _selectedIndex == 0
                    ? Column(
                        children: [
                          CommonField(
                            controller: fixPriceControllerController,
                            keyboardType: TextInputType.number,
                            prefixIcon: IconClass.appIcon,
                            onChanged: (onChanged) {
                              setState(() {
                                _inputText = onChanged;
                              });
                            },
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Price',
                            isPrefix: false,
                          ),
                          SizedBox(
                            height: Adaptive.px(15),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CommonField(
                            controller: offerPriceControllerController,
                            keyboardType: TextInputType.number,
                            prefixIcon: IconClass.appIcon,
                            onChanged: (onChanged) {},
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Price',
                            isPrefix: false,
                          ),
                          SizedBox(
                            height: Adaptive.px(15),
                          ),
                          CommonField(
                            controller: discountPriceControllerController,
                            keyboardType: TextInputType.number,
                            prefixIcon: IconClass.appIcon,
                            onChanged: (onChanged) {},
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Price',
                            isPrefix: false,
                          ),
                          SizedBox(
                            height: Adaptive.px(15),
                          ),
                          CommonField(
                            controller: otherPriceControllerController,
                            keyboardType: TextInputType.number,
                            prefixIcon: IconClass.appIcon,
                            onChanged: (onChanged) {
                              setState(() {
                                _inputText = onChanged;
                              });
                            },
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Price',
                            isPrefix: false,
                          ),
                          SizedBox(
                            height: Adaptive.px(15),
                          ),
                        ],
                      ),
                _inputText.isNotEmpty
                    ? Center(
                        child: GestureDetector(
                          onTap: () => Get.to(() => const QrCodeScannerPage()),
                          child: Column(
                            children: [
                              Text(
                                'EAN Number',
                                style: GoogleFonts.poppins(
                                    fontSize: Adaptive.px(10),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: _inputText,
                                height: 80,
                                width: 200,
                              ),
                            ],
                          ),
                        ),
                      )
                    : CommonField(
                        controller: eanController,
                        keyboardType: TextInputType.number,
                        prefixIcon: IconClass.appIcon,
                        isReadOnly: true,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'EAN Code',
                        isPrefix: false,
                      ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                Container(
                  height: Get.height * 0.06,
                  width: Adaptive.w(100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Adaptive.w(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatted.isEmpty ? 'Expiry Date' : formatted,
                          style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(14),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Image.asset(IconClass.calendar),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: Adaptive.h(15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            List.generate(5, (index) => _buildContainer(index)),
                      ),
                    )),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                PrimaryButton(
                  onTap: () {},
                  text: 'Add Product',
                ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index) {
    return GestureDetector(
      onTap: () => _takePicture(index),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: Adaptive.px(88),
            height: Adaptive.px(88),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: DottedBorder(
              dashPattern: const [4, 4],
              radius: const Radius.circular(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _imageFiles[index] != null
                    ? SizedBox(
                        height: Adaptive.px(88),
                        width: Adaptive.px(88),
                        child: Image.file(
                          _imageFiles[index]!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconClass.camera,
                              color: Colors.grey,
                            ),
                            Text(
                              'Add Photos',
                              style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(10),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
