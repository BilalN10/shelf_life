import 'package:get/get.dart';

class ItemCounterController extends GetxController {
  RxInt counter = 1.obs;
  increment() {
    counter = counter++;
  }

  decrement() {
    counter <= 1 ? counter = 1 as RxInt : counter = counter - 1;
  }
}
