import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/authentication/forgot_pass_page.dart';
import 'package:shelf_life/views/pages/authentication/register_page.dart';
import 'package:shelf_life/views/pages/bottom_nav/bottom_nav_page.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/social_logins.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _showSuffixIcon = false;
  bool showPass = true;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_handlePasswordInput);
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void _handlePasswordInput() {
    setState(() {
      _showSuffixIcon = passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:
            BoxDecoration(color: ColorClass.lightPrimaryColor.withOpacity(.02)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Adaptive.px(68)),
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(20),
                      fontWeight: FontWeight.w600,
                      color: ColorClass.lightPrimaryColor),
                ),
                Text(
                  'Sign in with your email/ phone number and password to continue.',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff080C2F).withOpacity(.5)),
                ),
                SizedBox(
                  height: Adaptive.px(30),
                ),
                CommonField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: IconClass.emailIcon,
                  hintText: 'Email',
                  onChanged: (value) {},
                  validator: (value) {
                    return;
                  },
                ),
                SizedBox(
                  height: Adaptive.px(17),
                ),
                TextFormField(
                  obscureText: showPass,
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  onChanged: (onChanged) {},
                  validator: (value) {
                    return;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: _showSuffixIcon
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              child: Image.asset(IconClass.showPass))
                          : null,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 4, vertical: Adaptive.h(2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: ColorClass.lightPrimaryColor,
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          )),
                      prefixIcon: Image.asset(
                        IconClass.password,
                        color: const Color(0xff080C2F),
                      ),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: Adaptive.px(14),
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => Get.to(() => ForgotPassPage()),
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(12),
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff080C2F)),
                      )),
                ),
                PrimaryButton(
                  onTap: () => Get.offAll(() => const BottomNavPage()),
                  text: 'Sign In',
                ),
                SizedBox(
                  height: Adaptive.px(57),
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
                SizedBox(height: Adaptive.px(30)),
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
                        onPressed: () => Get.to(() => RegisterPage()),
                        child: Text(
                          'Sign Up',
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
      ),
    );
  }
}
