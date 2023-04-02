import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  CustomBackButton({
    super.key,
    this.isLightColor = false,
  });
  bool isLightColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: Adaptive.px(51),
        width: Adaptive.px(51),
        decoration: BoxDecoration(
          color: isLightColor ? Colors.white.withOpacity(.2) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffB2B2B2).withOpacity(.16), blurRadius: 5),
          ],
        ),
        child: Center(
          child: Image.asset(
            IconClass.back,
            color: isLightColor ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
