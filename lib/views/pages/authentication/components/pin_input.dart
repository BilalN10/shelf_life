import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

class PinInput extends StatelessWidget {
  const PinInput({
    super.key,
    required this.otpInputController,
  });
  final TextEditingController otpInputController;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pinput(
        controller: otpInputController,
        defaultPinTheme: PinTheme(
          height: Adaptive.px(58),
          width: Adaptive.px(58),
          textStyle: GoogleFonts.poppins(
              fontSize: Adaptive.px(18),
              fontWeight: FontWeight.w500,
              color: Colors.black),
          decoration: BoxDecoration(
            border: Border.all(color: ColorClass.primaryColor.withOpacity(.3)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: Adaptive.px(58),
          width: Adaptive.px(58),
          decoration: BoxDecoration(
            color: ColorClass.lightPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onCompleted: (pin) => print(pin),
      ),
    );
  }
}
