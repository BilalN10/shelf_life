import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelf_life/next_page.dart';

class CheckHome extends StatefulWidget {
  const CheckHome({super.key});

  @override
  State<CheckHome> createState() => _CheckHomeState();
}

class _CheckHomeState extends State<CheckHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              child: Text('English')),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('it', 'IT'));
              },
              child: Text('italian')),
          ElevatedButton(
              onPressed: () {
                Get.to(() => NextPage());
              },
              child: Text('Next'))
        ],
      ),
    );
  }
}
