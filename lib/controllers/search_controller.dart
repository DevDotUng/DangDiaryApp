import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  RxBool isFocus = false.obs;

  void changeFocus(bool focus) {
    isFocus(focus);
  }
}
