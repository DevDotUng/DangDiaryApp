import 'package:dangdiarysample/models/sticker/sticker_detail_model.dart';
import 'package:dangdiarysample/repositories/sticker_repository.dart';
import 'package:get/get.dart';

class StickerDetailController extends GetxController {
  late int challengeId;
  StickerDetailController({required this.challengeId});
  static StickerDetailController get to => Get.find();

  final stickerDetailModel = Rxn<StickerDetailModel>();

  @override
  void onInit() {
    stickerDetailInit();
    super.onInit();
  }

  Future<void> stickerDetailInit() async {
    StickerDetailModel stickerDetailModelTemp =
        await StickerRepository().getStickerDetailView(challengeId);
    stickerDetailModel(stickerDetailModelTemp);
  }
}
