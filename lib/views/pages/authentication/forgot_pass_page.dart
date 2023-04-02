import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/authentication/verify_email_page.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC).withOpacity(.1),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Adaptive.px(54), horizontal: Adaptive.px(23)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(),
                Align(
                  child: Image.asset(
                    IconClass.forgotpass,
                    scale: 0.9,
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(60),
                ),
                Text(
                  'Forgot your Password?',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(20),
                      fontWeight: FontWeight.w600,
                      color: ColorClass.lightPrimaryColor),
                ),
                Text(
                  'Please, enter your email address. You will receive a OTP to create a new password. ',
                  style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(14),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff080C2F).withOpacity(.5),
                  ),
                ),
                SizedBox(height: Adaptive.px(30)),
                CommonField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: IconClass.emailIcon,
                  onChanged: (onChanged) {},
                  validator: (validator) {
                    return;
                  },
                  hintText: 'Email',
                ),
                SizedBox(height: Adaptive.px(30)),
                PrimaryButton(
                  onTap: () => Get.to(() => VerifyEmailPage(
                        getMail: emailController.text,
                      )),
                  text: 'Send',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
