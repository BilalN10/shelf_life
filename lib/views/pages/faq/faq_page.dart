import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  bool isFAQ1 = false;
  bool isFAQ2 = false;
  bool isFAQ3 = false;
  bool isFAQ4 = false;
  bool isFAQ5 = false;
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
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    const Spacer(),
                    Text(
                      'FAQ',
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
                  height: Adaptive.px(15),
                ),
                Image.asset(IconClass.faq),
                SizedBox(
                  height: Adaptive.px(25),
                ),
                Text(
                  'Frequently Asked Question',
                  style: GoogleFonts.poppins(
                      fontSize: Adaptive.px(18),
                      fontWeight: FontWeight.w600,
                      color: ColorClass.lightPrimaryColor),
                ),
                SizedBox(
                  height: Adaptive.px(25),
                ),
                FAQQuestion(
                  title: '1. Lorem ipsum dolor sit amet',
                  subtitle:
                      'Lorem ipsum dolor sit amet consecte. Id augue sed morbi fusce vestibulum tortor sed vel orci.',
                  isFAQ1: isFAQ1,
                  onTap: () {
                    setState(() {
                      isFAQ1 = !isFAQ1;
                    });
                  },
                ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                FAQQuestion(
                  title: '2. Lorem ipsum dolor sit amet',
                  subtitle:
                      'Lorem ipsum dolor sit amet consecte. Id augue sed morbi fusce vestibulum tortor sed vel orci.',
                  isFAQ1: isFAQ2,
                  onTap: () {
                    setState(() {
                      isFAQ2 = !isFAQ2;
                    });
                  },
                ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                FAQQuestion(
                  title: '3. Lorem ipsum dolor sit amet',
                  subtitle:
                      'Lorem ipsum dolor sit amet consecte. Id augue sed morbi fusce vestibulum tortor sed vel orci.',
                  isFAQ1: isFAQ3,
                  onTap: () {
                    setState(() {
                      isFAQ3 = !isFAQ3;
                    });
                  },
                ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                FAQQuestion(
                  title: '4. Lorem ipsum dolor sit amet',
                  subtitle:
                      'Lorem ipsum dolor sit amet consecte. Id augue sed morbi fusce vestibulum tortor sed vel orci.',
                  isFAQ1: isFAQ4,
                  onTap: () {
                    setState(() {
                      isFAQ4 = !isFAQ4;
                    });
                  },
                ),
                SizedBox(
                  height: Adaptive.px(15),
                ),
                FAQQuestion(
                  title: '5. Lorem ipsum dolor sit amet',
                  subtitle:
                      'Lorem ipsum dolor sit amet consecte. Id augue sed morbi fusce vestibulum tortor sed vel orci.',
                  isFAQ1: isFAQ5,
                  onTap: () {
                    setState(() {
                      isFAQ5 = !isFAQ5;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FAQQuestion extends StatelessWidget {
  const FAQQuestion({
    super.key,
    required this.isFAQ1,
    required this.onTap,
    required this.subtitle,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final bool isFAQ1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 10),
        height: isFAQ1 ? Adaptive.px(125) : Adaptive.px(60),
        width: Adaptive.w(100),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.white.withOpacity(.9), blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        fontSize: Adaptive.px(14),
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        ColorClass.lightPrimaryColor.withOpacity(.2),
                    child: Center(
                      child: Icon(
                        isFAQ1 ? Icons.remove : Icons.add,
                        color: ColorClass.lightPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            isFAQ1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                          fontSize: Adaptive.px(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
