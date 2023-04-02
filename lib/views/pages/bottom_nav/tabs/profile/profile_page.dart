import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/change_pass/change_pass_page.dart';
import 'package:shelf_life/views/pages/personal_information/personal_information_page.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  image: IconClass.faq,
                  title: 'FAQ',
                  onTap: () {},
                ),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.logout,
                  title: 'Logout',
                  onTap: () {},
                ),
                SizedBox(height: Adaptive.px(25)),
                PrimaryButton(
                    onTap: () {},
                    text: 'Delete Account',
                    isDeleteAccount: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.image,
    required this.onTap,
    required this.title,
  });
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Adaptive.px(60),
        width: Adaptive.w(100),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                color: const Color(0xff000000),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: Adaptive.px(14), fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Image.asset(
                IconClass.forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
