import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

// ignore: must_be_immutable
class CommonField extends StatelessWidget {
  CommonField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.onChanged,
    required this.validator,
    required this.hintText,
    this.isReadOnly = false,
    this.isPrefix = true,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  bool isReadOnly;
  bool isPrefix;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.07,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        readOnly: isReadOnly,
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
            prefixIcon: isPrefix
                ? Image.asset(
                    prefixIcon,
                    color: const Color(0xff080C2F),
                  )
                : SizedBox(),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xff080C2F),
              fontSize: Adaptive.px(14),
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
