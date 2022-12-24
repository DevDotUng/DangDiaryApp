import 'package:get/get.dart';

class DiariesController extends GetxController {
  static DiariesController get to => Get.find();

  RxBool isFold = true.obs;

  void foldDiary() {
    isFold(!isFold.value);
  }
}
