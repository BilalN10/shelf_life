import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({
    super.key,
    this.isCheck = false,
    required this.title,
  });
  bool isCheck;
  final String title;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: Adaptive.px(14),
            fontWeight: FontWeight.w400,
            color: const Color(0xff222222),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.isCheck = !widget.isCheck;
            });
          },
          child: Container(
            height: Adaptive.px(22),
            width: Adaptive.px(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
                  widget.isCheck ? ColorClass.lightPrimaryColor : Colors.white,
              border: Border.all(
                color: const Color(0xffA7A7A7),
              ),
            ),
            child: Center(
              child: widget.isCheck
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 12,
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
