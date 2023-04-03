import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/models/notification_model.dart';
import 'package:shelf_life/views/widgets/custom_back_button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
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
                    'Notification',
                    style: GoogleFonts.poppins(
                        fontSize: Adaptive.px(16), fontWeight: FontWeight.w600),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adaptive.w(2), vertical: 12),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: Adaptive.w(100),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(.2),
                                  blurRadius: 2,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                notificationList[index].isRead
                                    ? const CircleAvatar(
                                        radius: 6,
                                        backgroundColor:
                                            ColorClass.lightPrimaryColor,
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage(notificationList[index].image),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: Adaptive.w(60),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: notificationList[index]
                                              .senderName,
                                          style: GoogleFonts.poppins(
                                            fontSize: Adaptive.px(14),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff222222),
                                          ),
                                        ),
                                        TextSpan(
                                          text: notificationList[index].message,
                                          style: GoogleFonts.poppins(
                                            fontSize: Adaptive.px(14),
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff222222)
                                                .withOpacity(.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
