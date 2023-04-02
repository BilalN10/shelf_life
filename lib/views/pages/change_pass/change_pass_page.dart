import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(29),
              right: Adaptive.px(29),
              top: Adaptive.px(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    const Spacer(),
                    Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.px(25)),
                CommonField(
                  controller: oldPassController,
                  keyboardType: TextInputType.name,
                  prefixIcon: IconClass.password,
                  onChanged: (onChanged) {},
                  validator: (validator) {
                    return;
                  },
                  hintText: 'Enter old password',
                ),
                SizedBox(
                  height: Adaptive.px(10),
                ),
                CommonField(
                  controller: newPassController,
                  keyboardType: TextInputType.name,
                  prefixIcon: IconClass.password,
                  onChanged: (onChanged) {},
                  validator: (validator) {
                    return;
                  },
                  hintText: 'Set new password',
                ),
                SizedBox(height: Adaptive.px(35)),
                PrimaryButton(onTap: () {}, text: 'Change Password')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
