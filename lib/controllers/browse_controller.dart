import 'package:dangdiarysample/models/browse/browse_view_model.dart';
import 'package:dangdiarysample/repositories/browse_repository.dart';
import 'package:get/get.dart';

class BrowseController extends GetxController {
  static BrowseController get to => Get.find();

  final browseViewModel = Rxn<BrowseViewModel>();

  RxBool isFocus = false.obs;

  @override
  void onInit() {
    browseInit();
    super.onInit();
  }

  Future<void> browseInit() async {
    BrowseViewModel browseViewModelTemp =
        await BrowseRepository().getBrowseView();
    browseViewModel(browseViewModelTemp);
  }

  void changeFocus(bool focus) {
    isFocus(focus);
  }
}
