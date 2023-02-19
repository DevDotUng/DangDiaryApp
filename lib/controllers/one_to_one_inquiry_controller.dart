import 'package:get/get.dart';

class OneToOneInquiryController extends GetxController {
  static OneToOneInquiryController get to => Get.find();

  RxInt inquiryCategoryIndex = 6.obs;

  void changeInquiryCategoryIndex(int index) {
    inquiryCategoryIndex(index);
  }
}
