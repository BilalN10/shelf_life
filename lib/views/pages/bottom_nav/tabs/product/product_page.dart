import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/models/product_list_model.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/product/add_product_page.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: Padding(
        padding: EdgeInsets.only(
            left: Adaptive.px(10),
            right: Adaptive.px(10),
            top: Adaptive.px(30)),
        child: SizedBox(
          height: Adaptive.h(100),
          width: Adaptive.w(100),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  const Spacer(),
                  Text(
                    'Product List',
                    style: GoogleFonts.poppins(
                        fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: Adaptive.h(70),
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(Adaptive.px(11)),
                          height: Adaptive.px(109),
                          width: Adaptive.w(100),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(.2),
                                    blurRadius: 4)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Adaptive.px(9)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Adaptive.px(90),
                                  height: Adaptive.px(93),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            productList[index].image),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                SizedBox(
                                  width: Adaptive.w(2),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      productList[index].name,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: Adaptive.px(5),
                                    ),
                                    Text(
                                      productList[index].expiryDate,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff080C2F)
                                              .withOpacity(.4)),
                                    ),
                                    SizedBox(
                                      height: Adaptive.px(5),
                                    ),
                                    Text(
                                      productList[index].price,
                                      style: GoogleFonts.poppins(
                                        fontSize: Adaptive.px(12),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => Get.to(() => AddProductPage()),
                                  child: Container(
                                    width: Adaptive.px(70),
                                    height: Adaptive.px(30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        gradient: const LinearGradient(
                                          colors: [
                                            ColorClass.primaryColor,
                                            ColorClass.lightPrimaryColor
                                          ],
                                        )),
                                    child: Center(
                                      child: Text(
                                        'View',
                                        style: GoogleFonts.poppins(
                                            fontSize: Adaptive.px(12),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: Adaptive.px(10),
              ),
              PrimaryButton(
                  onTap: () => Get.to(() => AddProductPage()),
                  text: 'Add Product'),
            ],
          ),
        ),
      ),
    );
  }
}
