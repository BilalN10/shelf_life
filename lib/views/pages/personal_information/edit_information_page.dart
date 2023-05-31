import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/constants/maxin_validator.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/models/user_model.dart';
import 'package:shelf_life/views/pages/authentication/components/phone_textfield.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class EditInformationPage extends StatefulWidget {
  const EditInformationPage({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<EditInformationPage> createState() => _EditInformationPageState();
}

class _EditInformationPageState extends State<EditInformationPage>
    with ValidationMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController alterEmailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.userModel.userName!;
    surnameController.text = widget.userModel.surname!;

    alterEmailController.text = widget.userModel.alternativeEmail!;

    phoneController.text = widget.userModel.phoneNumber!;

    super.initState();
  }

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

  AuthController authController = Get.put(AuthController());

  var maskFormatter = MaskTextInputFormatter(
      mask: '### - ### - ### - ##', filter: {"#": RegExp(r'[0-9]')});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            BoxDecoration(color: ColorClass.lightPrimaryColor.withOpacity(.02)),
        child: Padding(
          padding: EdgeInsets.only(
            top: Adaptive.px(54),
            left: Adaptive.px(23),
            right: Adaptive.px(23),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(),
                    const Spacer(),
                    Text(
                      'Edit Information',
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
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      customPickImage(context),
                      SizedBox(height: Adaptive.px(37)),
                      CommonField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.person,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return isFullNameValid(validator!)
                              ? null
                              : 'requried';
                        },
                        hintText: '',
                      ),
                      SizedBox(height: Adaptive.px(15)),
                      CommonField(
                        controller: surnameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.person,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return isFullNameValid(validator!)
                              ? null
                              : 'requried';
                        },
                        hintText: '',
                      ),
                      SizedBox(height: Adaptive.px(15)),
                      CommonField(
                        controller: alterEmailController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.emailIcon,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return isEmailValid(validator!)
                              ? null
                              : 'Enter valid email';
                        },
                        hintText: '',
                      ),
                      SizedBox(height: Adaptive.px(15)),
                      PhoneTextField(
                          validator: (phone) {
                            return isFullNameValid(phone!) ? null : 'requried';
                          },
                          phoneController: phoneController,
                          maskFormatter: maskFormatter,
                          hintText: '012-345-678'),
                      SizedBox(height: Adaptive.px(60)),
                      Obx(
                        () => authController.isProfileUpdate.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: ColorClass.primaryColor,
                              ))
                            : PrimaryButton(
                                onTap: () {
                                  if (_key.currentState!.validate()) {
                                    authController.updateProfile(
                                        userName: nameController.text,
                                        surName: surnameController.text,
                                        email: alterEmailController.text,
                                        phone: phoneController.text,
                                        file: image);
                                  }
                                },
                                text: 'Save'),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                    ],
                  ),
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
                        : widget.userModel.profilePic!.isNotEmpty
                            ? SizedBox(
                                width: Adaptive.w(40),
                                height: Adaptive.h(25),
                                child: DottedBorder(
                                  color: ColorClass.lightPrimaryColor,
                                  strokeWidth: 2,
                                  borderType: BorderType.Circle,
                                  dashPattern: const [5, 6],
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 80,
                                      backgroundImage: NetworkImage(
                                          widget.userModel.profilePic!),
                                      //   child: Image.network(
                                      //       cont.getUserData.profilePic!),
                                    ),
                                  ),
                                ),
                              )
                            : Image.asset(
                                'assets/images/profileimage.png',
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
