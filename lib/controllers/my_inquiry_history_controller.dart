import 'package:dangdiarysample/models/customer_center/Inquiry_history_model.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:get/get.dart';

class MyInquiryHistoryController extends GetxController {
  static MyInquiryHistoryController get to => Get.find();

  RxList<InquiryHistoryModel> preparingForAnswerList =
      <InquiryHistoryModel>[].obs;
  RxList<InquiryHistoryModel> receivedList = <InquiryHistoryModel>[].obs;
  RxList<InquiryHistoryModel> answerCompleteList = <InquiryHistoryModel>[].obs;

  @override
  void onInit() async {
    await inquiryHistoryInit();

    super.onInit();
  }

  Future<void> inquiryHistoryInit() async {
    preparingForAnswerList.clear();
    receivedList.clear();
    answerCompleteList.clear();
    List<InquiryHistoryModel> inquiryHistoryModelList =
        await CustomerCenterRepository().getInquiryHistoryView();

    for (InquiryHistoryModel inquiryHistoryModel in inquiryHistoryModelList) {
      if (inquiryHistoryModel.progress == '답변 준비중') {
        preparingForAnswerList.add(inquiryHistoryModel);
      } else if (inquiryHistoryModel.progress == '접수 완료') {
        receivedList.add(inquiryHistoryModel);
      } else if (inquiryHistoryModel.progress == '답변 완료') {
        answerCompleteList.add(inquiryHistoryModel);
      }
    }
  }
}
