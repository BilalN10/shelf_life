import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/models/product_model.dart';
import 'package:shelf_life/models/recommended_model.dart';
import 'package:shelf_life/views/pages/bottom_nav/tabs/home/product_detail_page.dart';
import 'package:shelf_life/views/pages/profile/seller_profile_page.dart';
import 'package:shelf_life/controllers/product_controller.dart';

class PickupNow extends StatelessWidget {
  PickupNow({
    super.key,
  });

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.w(100),
      height: Adaptive.px(265),
      child: GetX<ProductController>(
          init: productController,
          builder: (cont) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cont.getrecomendedProductList.length,
              itemBuilder: (context, index) {
                ProductModel productModel =
                    cont.getrecomendedProductList[index];
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => Get.to(() => ProductDetailPage(
                              productModel: productModel,
                            )),
                        child: Container(
                          height: Adaptive.px(286),
                          width: Adaptive.px(318),
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
                                height: Adaptive.h(14),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: Adaptive.px(6)),
                                          child: Text(
                                            "${productModel.quantity} left",
                                            style: GoogleFonts.poppins(
                                              fontSize: Adaptive.px(8),
                                              color: const Color(0xff080C2F)
                                                  .withOpacity(.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Adaptive.w(8),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: List.generate(
                                                  5,
                                                  (index) => Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: Adaptive.px(20),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        const Spacer(),
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '5.00',
                                                style: GoogleFonts.poppins(
                                                  fontSize: Adaptive.px(12),
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                ' of 312',
                                                style: GoogleFonts.poppins(
                                                  fontSize: Adaptive.px(12),
                                                  color: const Color(0xff080C2F)
                                                      .withOpacity(.5),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: Adaptive.px(15)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
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
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
