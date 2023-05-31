import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/models/user_model.dart';
import 'package:shelf_life/views/pages/personal_information/edit_information_page.dart';
import 'package:shelf_life/views/widgets/common_field.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class PeronsalInformationPage extends StatefulWidget {
  final UserModel userModel;
  const PeronsalInformationPage({super.key, required this.userModel});

  @override
  State<PeronsalInformationPage> createState() =>
      _PeronsalInformationPageState();
}

class _PeronsalInformationPageState extends State<PeronsalInformationPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController lnameController = TextEditingController();

  final TextEditingController mailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    nameController.text = widget.userModel.userName!;
    lnameController.text = widget.userModel.surname!;

    mailController.text = widget.userModel.alternativeEmail!;

    phoneController.text = widget.userModel.phoneNumber!;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(29),
              right: Adaptive.px(29),
              top: Adaptive.px(30)),
          child: SingleChildScrollView(
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Column(
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
                            child: CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  NetworkImage(widget.userModel.profilePic!),
                              //   child: Image.network(
                              //       cont.getUserData.profilePic!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.px(30)),
                      CommonField(
                        isReadOnly: true,
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.person,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'Ankon',
                      ),
                      SizedBox(height: Adaptive.px(10)),
                      CommonField(
                        isReadOnly: true,
                        controller: lnameController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.person,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'John ',
                      ),
                      SizedBox(height: Adaptive.px(10)),
                      CommonField(
                        isReadOnly: true,
                        controller: mailController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.emailIcon,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: 'john002@gmail.com ',
                      ),
                      SizedBox(height: Adaptive.px(10)),
                      CommonField(
                        isReadOnly: true,
                        controller: phoneController,
                        keyboardType: TextInputType.name,
                        prefixIcon: IconClass.emailIcon,
                        onChanged: (onChanged) {},
                        validator: (validator) {
                          return;
                        },
                        hintText: '012-345-678',
                      ),
                      SizedBox(height: Adaptive.px(20)),
                      PrimaryButton(
                          onTap: () => Get.to(() => EditInformationPage(
                                userModel: widget.userModel,
                              )),
                          text: 'Edit Information'),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
