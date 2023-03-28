import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';

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
      "title": "Welcome to Shelf Life! ",
      "description":
          " A platform dedicated to helping individuals to reduce food waste and promote sustainable food practices. ",
    },
    {
      "image": 'assets/icons/onboarding2.png',
      "title": "Welcome to Shelf Life! ",
      "description":
          " A platform dedicated to helping individuals to reduce food waste and promote sustainable food practices. "
    },
    {
      "image": "assets/icons/onboarding3.png",
      "title": "Welcome to Shelf Life! ",
      "description":
          " A platform dedicated to helping individuals to reduce food waste and promote sustainable food practices. "
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
              SvgPicture.asset(
                IconClass.appName,
                height: Adaptive.h(5),
              ),
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
                child: Container(
                  height: Adaptive.px(60),
                  width: Adaptive.px(317),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [
                        ColorClass.primaryColor,
                        ColorClass.lightPrimaryColor
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Started",
                          style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(16),
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
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
        )

        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: Adaptive.w(3)),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: List.generate(
        //       splashData.length,
        //       (index) {
        //         return AnimatedContainer(
        //           duration: const Duration(milliseconds: 200),
        //           margin: const EdgeInsets.only(right: 5),
        //           height: index == 2 ? 40 : 6,
        //           width: selectedIndex == index ? 30 : 6,
        //           decoration: BoxDecoration(
        //             borderRadius: selectedIndex == index
        //                 ? BorderRadius.circular(5)
        //                 : BorderRadius.circular(30),
        //             color: selectedIndex == index
        //                 ? ColorClass.primaryColor
        //                 : Colors.grey,
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),

        );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: selectedIndex == index ? 30 : 6,
      decoration: BoxDecoration(
        borderRadius: selectedIndex == index
            ? BorderRadius.circular(5)
            : BorderRadius.circular(30),
        color: selectedIndex == index ? ColorClass.primaryColor : Colors.grey,
      ),
    );
  }
}
