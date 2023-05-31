import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/product_controller.dart';
import 'package:shelf_life/models/food_prefrence_model.dart';
import 'package:shelf_life/views/pages/filter/filter_page.dart';
import 'package:shelf_life/views/pages/notification/notification_page.dart';
import 'package:shelf_life/views/widgets/search-field.dart';
import 'components/pickup_now.dart';
import 'components/recommented_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  int selectedIndex = -1;

  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    print('init call');
    productController.getRecomendedProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorClass.lightPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: Adaptive.h(80),
            width: Adaptive.w(100),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFAFAFA),
                  Color(0xffFAFAFA),
                  Color(0xffF8FFF8),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Adaptive.px(0), vertical: Adaptive.px(32)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Adaptive.w(70),
                            child: SearchField(
                              controller: searchController,
                              onChanged: (onChanged) {},
                            ),
                          ),
                          SizedBox(
                            width: Adaptive.px(15),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => FilterPage()),
                            child: Image.asset(IconClass.filter),
                          ),
                          SizedBox(
                            width: Adaptive.px(21),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => const NotificationPage()),
                            child: Image.asset(IconClass.notification),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Adaptive.px(30)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: Adaptive.px(16),
                            ),
                          ),
                          Text(
                            'Find your product quickly  ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff080C2F).withOpacity(.5),
                              fontSize: Adaptive.px(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Adaptive.px(15)),
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              foodList.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    productController.getProductByCategory(
                                        foodList[index].name);

                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: Adaptive.px(106),
                                    height: Adaptive.px(59),
                                    decoration: BoxDecoration(
                                        color: selectedIndex == index
                                            ? ColorClass.primaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(9),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0xffB2B2B2)
                                                  .withOpacity(.2),
                                              blurRadius: 4)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              const Color(0xffF0F2F4),
                                          radius: 25,
                                          child: Image.asset(
                                            foodList[index].image,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Adaptive.px(6),
                                        ),
                                        Text(
                                          foodList[index].name,
                                          style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(12),
                                              fontWeight: FontWeight.w500,
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Adaptive.px(30)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: Text(
                        'Recommended for you',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Adaptive.px(16),
                        ),
                      ),
                    ),
                    RecommenedList(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Adaptive.px(20)),
                      child: Text(
                        'Pick up Now',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: Adaptive.px(16),
                        ),
                      ),
                    ),
                    PickupNow(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
