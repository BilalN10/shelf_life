import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

class CommonField extends StatelessWidget {
  const CommonField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.onChanged,
    required this.validator,
    required this.hintText,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
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
              prefixIcon,
              color: const Color(0xff080C2F),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: Adaptive.px(14),
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
