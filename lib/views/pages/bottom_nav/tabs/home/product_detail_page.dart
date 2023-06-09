import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';
import 'package:shelf_life/controllers/auth_controller.dart';
import 'package:shelf_life/controllers/item_counter_controller.dart';
import 'package:shelf_life/models/product_model.dart';
import 'package:shelf_life/models/recommended_model.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';
import 'package:shelf_life/views/widgets/feedback_container.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

import 'components/counter_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    required this.productModel,
  });
  final ProductModel? productModel;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ItemCounterController counterController =
      Get.put(ItemCounterController());
  AuthController authController = Get.put(AuthController());
  int selectedPrice = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.5,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.productModel!.mainImage!,
                      ),
                      fit: BoxFit.cover),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black12,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Adaptive.px(37), horizontal: Adaptive.px(23)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: Adaptive.px(30),
                              backgroundImage: NetworkImage(
                                  widget.productModel!.profilePic!),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.productModel!.userName!,
                              style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(18),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            CounerButton(
                              onTap: () {
                                counterController.decrement();
                              },
                              icon: Icons.remove,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              counterController.counter.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(14),
                                  color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            CounerButton(
                              onTap: () {
                                counterController.increment();
                              },
                              icon: Icons.add,
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.05,
                left: Get.width * 0.05,
                child: CustomBackButton(
                  isLightColor: true,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: Get.height * 0.53,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Adaptive.px(15),
                      left: Adaptive.px(23),
                      right: Adaptive.px(23),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productModel!.productName!,
                                style: GoogleFonts.poppins(
                                    fontSize: Adaptive.px(24),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                widget.productModel!.isFixedPrice!
                                    ? "\$ ${widget.productModel!.fixPrice!}"
                                    : "\$ ${widget.productModel!.price_1!}",
                                style: GoogleFonts.poppins(
                                    fontSize: Adaptive.px(24),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(IconClass.category),
                              Text(
                                'Vegetable',
                                style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(14),
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff080C2F).withOpacity(.5),
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 19,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '5.00 ',
                                        style: GoogleFonts.poppins(
                                            fontSize: Adaptive.px(12),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        ' from 312',
                                        style: GoogleFonts.poppins(
                                          fontSize: Adaptive.px(10),
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff080C2F)
                                              .withOpacity(.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(IconClass.calendar),
                              const SizedBox(width: 5),
                              Text(
                                widget.productModel!.date!,
                                style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(14),
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff080C2F).withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(IconClass.location),
                              const SizedBox(width: 5),
                              Text(
                                '6m',
                                style: GoogleFonts.poppins(
                                  fontSize: Adaptive.px(14),
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color(0xff080C2F).withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Adaptive.px(10)),
                          Text(
                            'What You Could Get',
                            style: GoogleFonts.poppins(
                              fontSize: Adaptive.px(14),
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          ExpandableText(
                            widget.productModel!.description!,
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                            linkColor: Colors.black,
                            style: GoogleFonts.poppins(
                                fontSize: Adaptive.px(12),
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff080C2F).withOpacity(.5)),
                          ),
                          SizedBox(height: Adaptive.px(14)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FeedBackContainer(
                                colors: [
                                  const Color(0xffFEE565).withOpacity(.2),
                                  const Color(0xffFEE565),
                                ],
                                image: IconClass.friendly,
                                title: 'Friendly Staff',
                                textColor: const Color(0xffE5BA02),
                              ),
                              FeedBackContainer(
                                colors: [
                                  const Color(0xffC9FFE9).withOpacity(.2),
                                  const Color(0xffC9FFE9),
                                ],
                                image: IconClass.quickpickup,
                                title: 'Quick Pickup',
                                textColor: const Color(0xff75BC85),
                              ),
                              FeedBackContainer(
                                colors: [
                                  const Color(0xffFEE565).withOpacity(.2),
                                  const Color(0xffFEE565),
                                ],
                                image: IconClass.delicious,
                                title: 'Delicious Food',
                                textColor: const Color(0xffF6842B),
                              ),
                            ],
                          ),
                          SizedBox(height: Adaptive.px(10)),
                          widget.productModel!.isFixedPrice!
                              ? SizedBox()
                              : Text(
                                  'Select Price',
                                  style: GoogleFonts.poppins(
                                    fontSize: Adaptive.px(14),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                          widget.productModel!.isFixedPrice!
                              ? SizedBox(height: Adaptive.px(10))
                              : Row(
                                  children: [
                                    selectPrice(
                                        '\$${widget.productModel!.price_1}', 0),
                                    const SizedBox(width: 10),
                                    selectPrice(
                                        '\$5${widget.productModel!.price_1} ',
                                        1),
                                    const SizedBox(width: 10),
                                    selectPrice(
                                        '\$10${widget.productModel!.price_1}',
                                        2),
                                  ],
                                ),
                          SizedBox(
                            height: Adaptive.px(20),
                          ),
                          authController.getUserData.userId ==
                                  widget.productModel!.userId!
                              ? SizedBox()
                              : Row(
                                  children: [
                                    Expanded(
                                        child: SecondaryButton(
                                            onTap: () {
                                              Get.snackbar(
                                                  'request_send'.tr,
                                                  'request_send_successfully'
                                                      .tr);
                                            },
                                            text: 'send_request'.tr)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: PrimaryButton(
                                            onTap: () {
                                              Get.snackbar(
                                                  'request_send'.tr,
                                                  'request_send_successfully'
                                                      .tr);
                                            },
                                            text: 'make_an_offer'.tr)),
                                  ],
                                ),
                          SizedBox(
                            height: Adaptive.px(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectPrice(String price, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedPrice = index),
      child: Container(
        height: Adaptive.px(36),
        width: Adaptive.px(57),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index == selectedPrice
                ? const Color(0xffEDFFEC)
                : const Color(0xffF5F5F5)),
        child: Center(
          child: Text(
            price,
            style: GoogleFonts.poppins(
                fontSize: Adaptive.px(14),
                color: index == selectedPrice
                    ? const Color(0xff44B749)
                    : const Color(0xff080C2F).withOpacity(.5)),
          ),
        ),
      ),
    );
  }
}
