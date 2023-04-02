import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/controllers/item_counter_controller.dart';
import 'package:shelf_life/models/recommended_model.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';

import 'components/counter_button.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({
    super.key,
    required this.modelData,
  });
  final RecommendedModel modelData;
  final ItemCounterController counterController =
      Get.put(ItemCounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                    image: AssetImage(
                      modelData.image,
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
                            backgroundImage: AssetImage(modelData.profileImage),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            modelData.profileName,
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
                                fontSize: Adaptive.px(14), color: Colors.white),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
