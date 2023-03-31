import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/models/food_prefrence_model.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';
import 'components/profile_progress_line.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController alterEmailController = TextEditingController();
  bool isFoodPrefrence = false;
  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //for picking video functionality
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.gallery);
            },
            child: Row(
              children: [
                const Icon(Icons.image, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Gallery',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Camera',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                const Icon(Icons.cancel, color: ColorClass.primaryColor),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.titleMedium!),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            BoxDecoration(color: ColorClass.lightPrimaryColor.withOpacity(.02)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Adaptive.px(54),
            horizontal: Adaptive.px(23),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    Text(
                      'Setup Profile',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.px(25)),
                ProfileProgressLine(isFoodPrefrence: isFoodPrefrence),
                SizedBox(height: Adaptive.px(48)),
                isFoodPrefrence
                    ? Column(
                        children: [
                          Text(
                            'Tell Us About Your Food\nPreferences',
                            style: GoogleFonts.poppins(
                                fontSize: Adaptive.px(24),
                                fontWeight: FontWeight.w600,
                                color: ColorClass.lightPrimaryColor),
                          ),
                          SizedBox(
                            height: Adaptive.h(60),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: foodList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: 1 / 1.5),
                              itemBuilder: (context, index) {
                                final food = foodList[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        food.isSelect = !food.isSelect;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: food.isSelect
                                              ? ColorClass.lightPrimaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 5)
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: Adaptive.px(57),
                                            width: Adaptive.px(57),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: food.isSelect
                                                    ? Colors.white
                                                    : const Color(0xffF0F2F4)),
                                            child: Center(
                                              child: Image.asset(food.image),
                                            ),
                                          ),
                                          SizedBox(height: Adaptive.px(10)),
                                          Text(
                                            food.name,
                                            style: GoogleFonts.poppins(
                                                color: food.isSelect
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: Adaptive.px(12)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFoodPrefrence = false;
                                    });
                                  },
                                  child: Container(
                                    height: Adaptive.px(60),
                                    width: Adaptive.w(100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xffF0F2F4),
                                          Color(0xffF0F2F4),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Back',
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(16),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff080C2F)
                                              .withOpacity(.4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Adaptive.px(16)),
                              Expanded(
                                  child: PrimaryButton(
                                      onTap: () {
                                        setState(() {
                                          isFoodPrefrence = true;
                                        });
                                      },
                                      text: 'Finish')),
                            ],
                          ),
                          SizedBox(height: Adaptive.h(2)),
                        ],
                      )
                    : Column(
                        children: [
                          customPickImage(context),
                          SizedBox(height: Adaptive.px(37)),
                          CommonField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            prefixIcon: IconClass.person,
                            onChanged: (onChanged) {},
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Name',
                          ),
                          SizedBox(height: Adaptive.px(15)),
                          CommonField(
                            controller: surnameController,
                            keyboardType: TextInputType.name,
                            prefixIcon: IconClass.person,
                            onChanged: (onChanged) {},
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Surname',
                          ),
                          SizedBox(height: Adaptive.px(15)),
                          CommonField(
                            controller: alterEmailController,
                            keyboardType: TextInputType.name,
                            prefixIcon: IconClass.emailIcon,
                            onChanged: (onChanged) {},
                            validator: (validator) {
                              return;
                            },
                            hintText: 'Alternative E-mail',
                          ),
                          SizedBox(height: Adaptive.px(60)),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: Adaptive.px(60),
                                  width: Adaptive.w(100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xffF0F2F4),
                                        Color(0xffF0F2F4),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Skip',
                                      style: GoogleFonts.poppins(
                                        fontSize: Adaptive.px(16),
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff080C2F)
                                            .withOpacity(.4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Adaptive.px(16)),
                              Expanded(
                                  child: PrimaryButton(
                                      onTap: () {
                                        setState(() {
                                          isFoodPrefrence = true;
                                        });
                                      },
                                      text: 'Next')),
                            ],
                          ),
                          SizedBox(height: Adaptive.h(2)),
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center customPickImage(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: Adaptive.w(40),
            height: Adaptive.h(25),
            child: DottedBorder(
              color: ColorClass.lightPrimaryColor,
              strokeWidth: 2,
              borderType: BorderType.Circle,
              dashPattern: const [5, 6],
              child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Center(
                    child: image != null
                        ? SizedBox(
                            child: CircleAvatar(
                              radius: Adaptive.px(70),
                              backgroundColor: Colors.white,
                              backgroundImage: FileImage(image!),
                            ),
                          )
                        : Image.asset(
                            'assets/icons/defaultImage.png',
                          ),
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                showOptionDialog(context);
              },
              child: CircleAvatar(
                radius: Adaptive.px(23),
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: Adaptive.px(46),
                    width: Adaptive.px(46),
                    decoration: const BoxDecoration(
                        color: ColorClass.primaryColor, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(IconClass.camera),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
