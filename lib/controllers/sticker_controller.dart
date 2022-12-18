import 'package:get/get.dart';

class StickerController extends GetxController {
  static StickerController get to => Get.find();

  @override
  void onInit() {
    loading();
    super.onInit();
  }

  RxBool isLoading = true.obs;
  void loading() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }
}
