import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelf_life/constants/colors.dart';
import 'package:shelf_life/views/widgets/primary_button.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorClass.primaryColor,
        title: Text('change_Language'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                  onTap: () {
                    Get.updateLocale(const Locale('en', 'US'));
                  },
                  text: 'English'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                  onTap: () {
                    Get.updateLocale(const Locale('it', 'IT'));
                  },
                  text: 'Italic'),
            ),
          ],
        ),
      ),
    );
  }
}
