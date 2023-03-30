import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class CreateNewPassPage extends StatelessWidget {
  CreateNewPassPage({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC).withOpacity(.1),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Adaptive.px(54), horizontal: Adaptive.px(23)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                Align(
                  child: Image.asset(
                    IconClass.verifyEmail,
                    scale: 0.9,
                  ),
                ),
                SizedBox(
                  height: Adaptive.px(60),
                ),
                Text(
                  'Create New Password',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(20),
                      fontWeight: FontWeight.w600,
                      color: ColorClass.lightPrimaryColor),
                ),
                SizedBox(
                  height: Adaptive.px(12),
                ),
                Text(
                  'Set new password for your account so that you can login and access all the features.',
                  style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(14),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff080C2F).withOpacity(.5),
                  ),
                ),
                SizedBox(height: Adaptive.px(20)),
                CommonField(
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  prefixIcon: IconClass.password,
                  onChanged: (onChanged) {},
                  validator: (validator) {
                    return;
                  },
                  hintText: 'Password',
                ),
                SizedBox(height: Adaptive.px(15)),
                CommonField(
                  controller: repasswordController,
                  keyboardType: TextInputType.name,
                  prefixIcon: IconClass.password,
                  onChanged: (onChanged) {},
                  validator: (validator) {
                    return;
                  },
                  hintText: 'Re-type Password',
                ),
                SizedBox(height: Adaptive.px(30)),
                PrimaryButton(
                  onTap: () {},
                  text: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
