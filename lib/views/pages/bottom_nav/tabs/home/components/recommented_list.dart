import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/controllers/product_controller.dart';
import 'package:shelf_life/models/product_model.dart';
import 'package:shelf_life/models/recommended_model.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/home/product_detail_page.dart';
import 'package:shelf_life/views/pages/profile/seller_profile_page.dart';

class RecommenedList extends StatelessWidget {
  RecommenedList({
    super.key,
  });

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(100),
      height: Adaptive.h(36),
      child: GetX<ProductController>(
          init: Get.put(ProductController()),
          builder: (cont) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cont.getrecomendedProductList.length,
              itemBuilder: (context, index) {
                ProductModel productModel =
                    cont.getrecomendedProductList[index];
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ProductDetailPage(
                            productModel: productModel,
                          )),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: Adaptive.px(255),
                        width: Adaptive.px(250),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff0B0B0B).withOpacity(.05),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Adaptive.h(16),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(productModel.mainImage!),
                                    fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () => Get.to(() => SellerProfilePage(
                                        sellerId: productModel.userId!,
                                        recommend: recommendedList[index],
                                      )),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                            productModel.profilePic!),
                                      ),
                                      SizedBox(
                                        width: Adaptive.px(10),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: Adaptive.px(12)),
                                        child: Text(
                                          productModel.userName!,
                                          style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(14),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.px(25), vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        productModel.productName!,
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(16),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Row(
                                        children: [
                                          Text(
                                            "${productModel.quantity} left",
                                            style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(8),
                                              color: const Color(0xff080C2F)
                                                  .withOpacity(.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        productModel.date!,
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(12),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const CircleAvatar(
                                        radius: 1,
                                        backgroundColor: Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '',
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(12),
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
                                            (index) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: Adaptive.px(20),
                                                )),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        productModel.isFixedPrice!
                                            ? "\$ ${productModel.fixPrice!}"
                                            : "\$ ${productModel.price_1!}",
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(14),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      // Text(
                                      //   recommendedList[index].price,
                                      //   style: GoogleFonts.poppins(
                                      //     textStyle: const TextStyle(
                                      //         decoration:
                                      //             TextDecoration.lineThrough),
                                      //     fontSize: Adaptive.px(10),
                                      //     color: const Color(0xff080C2F)
                                      //         .withOpacity(.5),
                                      //     fontWeight: FontWeight.w400,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
