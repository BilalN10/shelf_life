import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/profile/components/language_page.dart';
import 'package:shelf_life/views/pages/change_pass/change_pass_page.dart';
import 'package:shelf_life/views/pages/faq/faq_page.dart';
import 'package:shelf_life/views/pages/personal_information/personal_information_page.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';
import 'components/delete_account_dialog.dart';
import 'components/logout_dialog.dart';
import 'components/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    authController.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(10),
              right: Adaptive.px(10),
              top: Adaptive.px(35)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      'my_profile'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(16),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
                GetX<AuthController>(
                    init: authController,
                    builder: (cont) {
                      return cont.getUserData.email == null
                          ? const CircularProgressIndicator(
                              color: ColorClass.primaryColor,
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  width: Adaptive.w(40),
                                  height: Adaptive.h(25),
                                  child: DottedBorder(
                                    color: ColorClass.lightPrimaryColor,
                                    strokeWidth: 2,
                                    borderType: BorderType.Circle,
                                    dashPattern: const [5, 6],
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 80,
                                        backgroundImage: NetworkImage(
                                            cont.getUserData.profilePic!),
                                        //   child: Image.network(
                                        //       cont.getUserData.profilePic!),
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
                                      cont.getUserData.totalRating!.toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(22),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      ' / 5',
                                      style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(10),
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff222222)
                                              .withOpacity(.4)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: Adaptive.px(30)),
                                ProfileTile(
                                  image: IconClass.personal,
                                  title: 'personal_information'.tr,
                                  onTap: () =>
                                      Get.to(() => PeronsalInformationPage(
                                            userModel: cont.getUserData,
                                          )),
                                ),
                              ],
                            );
                    }),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.changePassword,
                  title: 'change_passeord'.tr,
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
                  image: IconClass.personal,
                  title: 'change_Language'.tr,
                  onTap: () => Get.to(() => const LanguagePage()),
                ),
                SizedBox(height: Adaptive.px(10)),
                ProfileTile(
                  image: IconClass.logout,
                  title: 'log_out'.tr,
                  onTap: () {
                    Get.dialog(LogoutDialog());
                  },
                ),
                SizedBox(height: Adaptive.px(25)),
                PrimaryButton(
                  onTap: () {
                    Get.dialog(DeleteAccountDialog(
                        emailController: emailController,
                        passwordController: passwordController));
                  },
                  text: 'delete_account'.tr,
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
