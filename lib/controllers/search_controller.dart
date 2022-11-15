import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get to => Get.find();
  RxBool isFocus = false.obs;

  @override
  void onInit() {
    loading();
    super.onInit();
  }

  void changeFocus(bool focus) {
    isFocus(focus);
  }

  RxBool isLoading = true.obs;
  void loading() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }
}
