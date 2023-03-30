import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/authentication/create_new_pass_page.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/pin_input.dart';

class VerifyEmailPage extends StatelessWidget {
  VerifyEmailPage({
    super.key,
    required this.getMail,
  });
  final String getMail;
  final TextEditingController otpInputController = TextEditingController();
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
                  'Verify Your Email',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(20),
                      fontWeight: FontWeight.w600,
                      color: ColorClass.lightPrimaryColor),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Please enter the 4 digit verification code sent to',
                        style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(14),
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff080C2F).withOpacity(.5),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(getMail,
                    style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(14),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff080C2F).withOpacity(.8),
                    )),
                SizedBox(height: Adaptive.px(30)),
                PinInput(
                  otpInputController: otpInputController,
                ),
                SizedBox(height: Adaptive.px(30)),
                PrimaryButton(
                  onTap: () => Get.to(() => CreateNewPassPage()),
                  text: 'Verify',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
