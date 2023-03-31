import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/home/home_page.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/product/product_page.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/profile/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedIndex = 0;
  final _pages = [
    HomePage(),
    ProductPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Column(
          children: [
            Expanded(
              child: _pages[selectedIndex],
            ),
            Container(
              height: Adaptive.px(82),
              width: Adaptive.w(100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.px(42.83)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bottomNavItem(IconClass.home, 'Home', 0),
                    bottomNavItem(IconClass.product, 'Product', 1),
                    bottomNavItem(IconClass.bottomProfile, 'Profile', 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(String image, String title, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            color: index == selectedIndex
                ? ColorClass.lightPrimaryColor
                : const Color(0xff000000).withOpacity(.5),
          ),
          SizedBox(height: Adaptive.px(6.37)),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: Adaptive.px(15),
                fontWeight: FontWeight.w400,
                color: index == selectedIndex
                    ? ColorClass.lightPrimaryColor
                    : const Color(0xff000000).withOpacity(.5)),
          )
        ],
      ),
    );
  }
}
