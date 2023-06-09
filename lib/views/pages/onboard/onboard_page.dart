import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/authentication/login_page.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'content.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int selectedIndex = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/icons/onboarding1.png",
      "title": "welcome".tr,
      "description": "onboarding".tr,
    },
    {
      "image": 'assets/icons/onboarding2.png',
      "title": "welcome".tr,
      "description": "onboarding".tr,
    },
    {
      "image": "assets/icons/onboarding3.png",
      "title": "welcome".tr,
      "description": "onboarding".tr,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconClass.appIcon,
                height: Adaptive.h(5),
              ),
              SizedBox(
                width: Adaptive.w(2),
              ),
              SvgPicture.asset(IconClass.appName, height: Adaptive.h(3)),
            ],
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: Adaptive.h(100),
          width: Adaptive.w(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Adaptive.h(70),
                width: Adaptive.w(100),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) {
                    index = selectedIndex;
                    return OnBoardContent(
                      image: splashData[index]["image"] as String,
                      title: splashData[index]["title"] as String,
                      description: splashData[index]["description"] as String,
                    );
                  },
                ),
              ),
              Visibility(
                visible: selectedIndex == splashData.length - 1,
                child: SizedBox(
                  width: Adaptive.px(317),
                  child: PrimaryButton(
                    onTap: () => Get.to(() => const LoginPage()),
                    isGetStartedButton: true,
                    text: '',
                  ),
                ),
              ),
              Visibility(
                visible: selectedIndex != splashData.length - 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: selectedIndex == index ? Adaptive.px(40) : 6,
      decoration: BoxDecoration(
        borderRadius: selectedIndex == index
            ? BorderRadius.circular(5)
            : BorderRadius.circular(30),
        color: selectedIndex == index ? ColorClass.primaryColor : Colors.grey,
      ),
    );
  }
}
