import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/constants/maxin_validator.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/views/pages/complete_profile/complete_profile_page.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/phone_textfield.dart';
import 'components/social_logins.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget with ValidationMixin {
  RegisterPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(
      mask: '### - ### - ### - ##', filter: {"#": RegExp(r'[0-9]')});

  AuthController authController = Get.put(AuthController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              color: ColorClass.lightPrimaryColor.withOpacity(.02)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Adaptive.px(68), horizontal: Adaptive.px(24)),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome To Shelf!',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(20),
                          fontWeight: FontWeight.w600,
                          color: ColorClass.lightPrimaryColor),
                    ),
                    Text(
                      'To get started, fill out the Sign up form.',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(14),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff080C2F).withOpacity(.5)),
                    ),
                    SizedBox(
                      height: Adaptive.px(30),
                    ),
                    CommonField(
                      controller: authController.emailCont,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: IconClass.emailIcon,
                      onChanged: (onChanged) {},
                      validator: (email) {
                        return isEmailValid(email!)
                            ? null
                            : 'Enter valid email';
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    CommonField(
                      controller: authController.passwordCont,
                      keyboardType: TextInputType.name,
                      prefixIcon: IconClass.password,
                      onChanged: (onChanged) {},
                      validator: (password) {
                        return isPasswordValid(password!)
                            ? null
                            : 'Enter password that contains minimum 8 letters';
                      },
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    CommonField(
                      controller: authController.reEnterPasswordCont,
                      keyboardType: TextInputType.name,
                      prefixIcon: IconClass.password,
                      onChanged: (onChanged) {},
                      validator: (value) {
                        if (value == authController.passwordCont.text) {
                          return null;
                        } else {
                          return 'Password does not match';
                        }
                      },
                      hintText: 'Re-type Password',
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    PhoneTextField(
                      hintText: 'Mobile Number',
                      phoneController: authController.phoneNumber,
                      maskFormatter: maskFormatter,
                      validator: (phone) {
                        return isFullNameValid(phone!) ? null : 'requried';
                      },
                    ),
                    SizedBox(
                      height: Adaptive.px(30),
                    ),
                    Obx(
                      () => authController.isSignUp.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: ColorClass.primaryColor,
                              ),
                            )
                          : PrimaryButton(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  authController.storeSignUp();
                                }
                              },
                              text: 'Sign UP',
                            ),
                    ),
                    SizedBox(
                      height: Adaptive.px(46),
                    ),
                    Row(
                      children: [
                        Container(
                          width: Adaptive.w(20),
                          height: .5,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: Adaptive.w(2),
                        ),
                        Text(
                          'Sign in with Google or Apple',
                          style: GoogleFonts.poppins(
                              fontSize: Adaptive.px(12),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: Adaptive.w(2),
                        ),
                        Container(
                          width: Adaptive.w(20),
                          height: .5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: Adaptive.px(24)),
                    SocialLogins(
                      appleLoginOnTap: () {},
                      googleLoginOnTap: () {},
                    ),
                    SizedBox(
                      height: Adaptive.px(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(14),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(14),
                                  fontWeight: FontWeight.w400,
                                  color: ColorClass.lightPrimaryColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
