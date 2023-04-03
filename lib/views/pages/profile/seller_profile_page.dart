import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/models/recommended_model.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({
    super.key,
    required this.recommend,
  });
  final RecommendedModel recommend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: SizedBox(
        height: Adaptive.h(100),
        width: Adaptive.w(100),
        child: Padding(
          padding: EdgeInsets.only(
              left: Adaptive.px(10),
              right: Adaptive.px(10),
              top: Adaptive.px(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    const Spacer(),
                    Text(
                      '${recommend.profileName} profile',
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
                  height: Adaptive.h(2),
                ),
                Container(
                  width: Adaptive.w(100),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(.4), blurRadius: 4),
                      ]),
                  child: Column(
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
                            child: Image.asset(
                              'assets/images/sansam.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        recommend.profileName,
                        style: GoogleFonts.poppins(
                            fontSize: Adaptive.px(20),
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Image.asset(
                                IconClass.ratingStar,
                                height: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '5.00',
                            style: GoogleFonts.poppins(
                                fontSize: Adaptive.px(12),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(IconClass.phone),
                          const SizedBox(width: 10),
                          Text(
                            'Phone Number',
                            style: GoogleFonts.poppins(
                                color: const Color(0xff080c2f).withOpacity(.7),
                                fontSize: Adaptive.px(14),
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            '171-158-935',
                            style: GoogleFonts.poppins(
                                color: const Color(0xff080c2f),
                                fontSize: Adaptive.px(14),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(IconClass.emailIcon),
                          const SizedBox(width: 10),
                          Text(
                            'Email',
                            style: GoogleFonts.poppins(
                                color: const Color(0xff080c2f).withOpacity(.7),
                                fontSize: Adaptive.px(14),
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            ' sam@gmail.com',
                            style: GoogleFonts.poppins(
                                color: const Color(0xff080c2f),
                                fontSize: Adaptive.px(14),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(2),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Adaptive.w(100),
                  height: Adaptive.h(35),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            // height: Adaptive.px(300),
                            width: Adaptive.px(170),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff0B0B0B).withOpacity(.05),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: Adaptive.px(140),
                                  width: Adaptive.px(170),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            recommendedList[index].image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Adaptive.px(25), vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recommendedList[index].drinkName,
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(10),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            recommendedList[index].expireDate,
                                            style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(8),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          const CircleAvatar(
                                            radius: 1,
                                            backgroundColor: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            recommendedList[index].distance,
                                            style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(8),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                                5,
                                                (index) => Image.asset(
                                                      IconClass.ratingStar,
                                                      height: 12,
                                                    )),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            recommendedList[index].price,
                                            style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(10),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            recommendedList[index].price,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                              fontSize: Adaptive.px(8),
                                              color: const Color(0xff080C2F)
                                                  .withOpacity(.5),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
