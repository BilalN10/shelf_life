import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/change_pass/change_pass_page.dart';
import 'package:shelf_life/views/pages/faq/faq_page.dart';
import 'package:shelf_life/views/pages/personal_information/personal_information_page.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';
import 'components/delete_account_dialog.dart';
import 'components/logout_dialog.dart';
import 'components/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                      'My Profile',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
                SizedBox(
                  width: Adaptive.w(40),
                  height: Adaptive.h(25),
                  child: DottedBorder(
                    color: ColorClass.lightPrimaryColor,
                    strokeWidth: 2,
                    borderType: BorderType.Circle,
                    dashPattern: const [5, 6],
                    child: Center(
                      child: Image.asset(
                        'assets/images/profileimage.png',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconClass.ratingStar),
                    const SizedBox(width: 6),
                    Text(
                      '4.7',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(22),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      ' / 5',
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(10),
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff222222).withOpacity(.4)),
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.px(30)),
                ProfileTile(
                  image: IconClass.personal,
                  title: 'Personal Information',
                  onTap: () => Get.to(() => PeronsalInformationPage()),
                ),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.changePassword,
                  title: 'Change Password',
                  onTap: () => Get.to(() => ChangePasswordPage()),
                ),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.faq1,
                  title: 'FAQ',
                  onTap: () => Get.to(() => const FaqPage()),
                ),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.logout,
                  title: 'Logout',
                  onTap: () {
                    Get.dialog(const LogoutDialog());
                  },
                ),
                SizedBox(height: Adaptive.px(25)),
                PrimaryButton(
                  onTap: () {
                    Get.dialog(DeleteAccountDialog(
                        emailController: emailController,
                        passwordController: passwordController));
                  },
                  text: 'Delete Account',
                  isDeleteAccount: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
