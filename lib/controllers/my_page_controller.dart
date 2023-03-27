import 'package:dangdiarysample/models/my_page/my_page_model.dart';
import 'package:dangdiarysample/repositories/my_page_repository.dart';
import 'package:get/get.dart';

class MyPageController extends GetxController {
  static MyPageController get to => Get.find();

  final myPageModel = Rxn<MyPageModel>();

  @override
  void onInit() {
    myPageInit();
    super.onInit();
  }

  Future<void> myPageInit() async {
    MyPageModel myPageModelTemp = await MyPageRepository().getHomeView();
    myPageModel(myPageModelTemp);
  }
}
