import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: Adaptive.px(51),
        width: Adaptive.px(51),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xffB2B2B2).withOpacity(.16), blurRadius: 5),
          ],
        ),
        child: Center(
          child: Image.asset(IconClass.back),
        ),
      ),
    );
  }
}
