import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

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
    return Container(
      width: Adaptive.w(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
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
