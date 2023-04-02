import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withOpacity(.4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Adaptive.px(403),
              width: Adaptive.px(327),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Adaptive.px(30)),
                child: Column(
                  children: [
                    Text(
                      'Delete Account',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffF12D2D)),
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(32)),
                      child: Text(
                        'If you’re sure that you want to delete your account, please enter your email and password below, and then press continue.',
                        style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(14),
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff080C2F)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: CommonField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: IconClass.emailIcon,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'Enter email',
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.px(15),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: CommonField(
                        controller: passwordController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.password,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'Enter password',
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.px(25),
                    ),
                    SizedBox(
                      width: Adaptive.px(112),
                      height: Adaptive.px(43),
                      child: PrimaryButton(
                          onTap: () {},
                          text: 'Continue',
                          isDeleteAccount: false),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
