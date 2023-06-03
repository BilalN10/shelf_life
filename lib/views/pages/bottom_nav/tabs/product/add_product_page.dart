import 'dart:io';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/constants/maxin_validator.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/controllers/product_controller.dart';
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

class _AddProductPageState extends State<AddProductPage> with ValidationMixin {
  // final TextEditingController productNameController = TextEditingController();
  // final TextEditingController descriptionController = TextEditingController();
  // final TextEditingController quantityController = TextEditingController();
  // final TextEditingController fixPriceControllerController =
  //     TextEditingController();
  // final TextEditingController eanController = TextEditingController();
  // final TextEditingController offerPriceControllerController =
  //     TextEditingController();
  // final TextEditingController discountPriceControllerController =
  //     TextEditingController();
  // final TextEditingController otherPriceControllerController =
  //     TextEditingController();
  String _inputText = '';

  final List<String> category = [
    'Fish',
    'Fruits',
    'Coffee',
    'Meat',
    'Drinks',
    'Dairy',
    'Snacks',
    'Soup',
    'Fries',
    'Sushi',
    'Soda',
  ];

  final List<String> categoryPrefrence = [
    'Garlic Sauce',
    'Sauce',
    'Tomato Sauce',
  ];
  int _selectedIndex = 0;
  final radioText = [
    'fixed_price'.tr,
    'offer_price'.tr,
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
  int imageIndex = -1;
  Future<void> _takePicture(int index) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imageIndex = index;
        print(' image index is $imageIndex');
      });

      await productController
          .uploadProductImage(File(pickedFile.path))
          .then((value) {
        setState(() {
          productController.imageList.add(value);
          _imageFiles[index] = File(pickedFile.path);
          print('image add ');
        });
      });
    }
    setState(() {
      imageIndex = -1;
    });
  }

  ProductController productController = Get.put(ProductController());
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    productController.foodCategory = '';
    productController.foodPreferance = '';
    productController.selectedFeature.clear();
    productController.imageList.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat format = DateFormat('MM-yyyy-dd');

    ///final String formatted = format.format(now);
    productController.date = format.format(now);

    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: SafeArea(
        child: SizedBox(
          height: Adaptive.h(100),
          width: Adaptive.w(100),
          child: Padding(
            padding: EdgeInsets.only(
                left: Adaptive.px(15),
                right: Adaptive.px(15),
                top: Adaptive.px(30)),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomBackButton(),
                        const Spacer(),
                        Text(
                          'add_product'.tr,
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
                      controller: productController.productNameCont,
                      keyboardType: TextInputType.name,
                      prefixIcon: IconClass.appIcon,
                      onChanged: (onChanged) {},
                      validator: (validator) {
                        return isFullNameValid(validator!) ? null : 'requried';
                      },
                      hintText: 'product_name'.tr,
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
                      controller: productController.descriptionCont,
                      validator: (validator) {
                        return isFullNameValid(validator!) ? null : 'requried';
                      },
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Text(
                      'feature'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
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
                                    print(selectFeatureList[index].colors);
                                    if (selectFeatureList[index].value) {
                                      productController.selectedFeature.add(
                                          SelectFeatureModel(
                                              image: selectFeatureList[index]
                                                  .image,
                                              name:
                                                  selectFeatureList[index].name,
                                              colors: selectFeatureList[index]
                                                  .colors,
                                              iconColor:
                                                  selectFeatureList[index]
                                                      .iconColor,
                                              unselectedIcon:
                                                  selectFeatureList[index]
                                                      .unselectedIcon));
                                      print(
                                          'length is ${productController.selectedFeature.length} ');
                                    } else {
                                      productController.selectedFeature
                                          .removeWhere((element) =>
                                              selectFeatureList[index].name ==
                                              element.name);
                                      print(
                                          'remove length ${productController.selectedFeature.length} ');
                                    }
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
                                  child: Image.asset(
                                      selectFeatureList[index].value
                                          ? selectFeatureList[index].image
                                          : selectFeatureList[index]
                                              .unselectedIcon),
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
                      controller: productController.quantityCont,
                      keyboardType: TextInputType.number,
                      prefixIcon: IconClass.appIcon,
                      onChanged: (onChanged) {},
                      validator: (validator) {
                        return isFullNameValid(validator!) ? null : 'requried';
                      },
                      hintText: 'quantity'.tr,
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Text(
                      'price_option'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
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
                                  print('value is $value');
                                  if (value == 0) {
                                    productController.isFixedPrice = true;
                                  } else {
                                    productController.isFixedPrice = false;
                                  }
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
                                controller: productController.fixedPrice,
                                keyboardType: TextInputType.number,
                                prefixIcon: IconClass.appIcon,
                                onChanged: (onChanged) {
                                  setState(() {
                                    _inputText = onChanged;
                                  });
                                },
                                validator: (validator) {
                                  return productController.isFixedPrice &&
                                          isFullNameValid(validator!)
                                      ? null
                                      : 'requried'.tr;
                                },
                                hintText: 'price'.tr,
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
                                controller: productController.price_1,
                                keyboardType: TextInputType.number,
                                prefixIcon: IconClass.appIcon,
                                onChanged: (onChanged) {},
                                validator: (validator) {
                                  return !productController.isFixedPrice &&
                                          isFullNameValid(validator!)
                                      ? null
                                      : 'requried'.tr;
                                },
                                hintText: 'price'.tr,
                                isPrefix: false,
                              ),
                              SizedBox(
                                height: Adaptive.px(15),
                              ),
                              CommonField(
                                controller: productController.price_2,
                                keyboardType: TextInputType.number,
                                prefixIcon: IconClass.appIcon,
                                onChanged: (onChanged) {},
                                validator: (validator) {
                                  return !productController.isFixedPrice &&
                                          isFullNameValid(validator!)
                                      ? null
                                      : 'requried'.tr;
                                },
                                hintText: 'price'.tr,
                                isPrefix: false,
                              ),
                              SizedBox(
                                height: Adaptive.px(15),
                              ),
                              CommonField(
                                controller: productController.price_3,
                                keyboardType: TextInputType.number,
                                prefixIcon: IconClass.appIcon,
                                onChanged: (onChanged) {
                                  setState(() {
                                    _inputText = onChanged;
                                  });
                                },
                                validator: (validator) {
                                  return !productController.isFixedPrice &&
                                          isFullNameValid(validator!)
                                      ? null
                                      : 'requried'.tr;
                                },
                                hintText: 'price'.tr,
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
                              onTap: () =>
                                  Get.to(() => const QrCodeScannerPage()),
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
                            controller: productController.eanCode,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productController.date.isEmpty
                                  ? 'Expiry Date'
                                  : productController.date,
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
                            children: List.generate(
                                5,
                                (index) => imageIndex == index
                                    ? Container(
                                        width: Adaptive.px(88),
                                        height: Adaptive.px(88),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: DottedBorder(
                                            dashPattern: const [4, 4],
                                            radius: const Radius.circular(12),
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: ColorClass.primaryColor,
                                              ),
                                            )))
                                    : _buildContainer(index)),
                          ),
                        )),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    Obx(
                      () => productController.isProductAdd.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorClass.primaryColor,
                              ),
                            )
                          : PrimaryButton(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  if (productController.foodCategory.isEmpty) {
                                    Get.snackbar(
                                        'product_catrgory_not_select'.tr,
                                        'select_product_category'.tr);
                                  } else if (productController
                                      .foodPreferance.isEmpty) {
                                    Get.snackbar(
                                        'product_preferances_not_select'.tr,
                                        'select_product_preferances'.tr);
                                  } else if (productController.date.isEmpty) {
                                    Get.snackbar('expiry_date_not_select'.tr,
                                        'select_expiry_date'.tr);
                                  } else if (productController
                                      .imageList.isEmpty) {
                                    Get.snackbar('product_image_not_select'.tr,
                                        'select_product_image'.tr);
                                  } else {
                                    productController.addProduct(
                                        Get.put(AuthController()).getUserData);
                                  }
                                } else {
                                  print('not validate');
                                }
                              },
                              text: 'add_product'.tr,
                            ),
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _takePicture(index);
        });
      },
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
                              'add_photo'.tr,
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
