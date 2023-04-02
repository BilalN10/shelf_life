import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CounerButton extends StatelessWidget {
  const CounerButton({
    super.key,
    required this.onTap,
    required this.icon,
  });
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Adaptive.px(24),
        width: Adaptive.px(24),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
          color: Colors.white.withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
