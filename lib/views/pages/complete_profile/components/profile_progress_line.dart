import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';

class ProfileProgressLine extends StatelessWidget {
  const ProfileProgressLine({
    super.key,
    required this.isFoodPrefrence,
  });

  final bool isFoodPrefrence;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: Adaptive.px(5),
            decoration: BoxDecoration(
                color: isFoodPrefrence
                    ? const Color(0xffE5F3E6)
                    : ColorClass.lightPrimaryColor,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(width: Adaptive.px(12)),
        Expanded(
          child: Container(
            height: Adaptive.px(5),
            decoration: BoxDecoration(
                color: isFoodPrefrence
                    ? ColorClass.lightPrimaryColor
                    : const Color(0xffE5F3E6),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
