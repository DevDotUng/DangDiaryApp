import 'package:dangdiarysample/models/customer_center/report_history_model.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:get/get.dart';

class MyReportHistoryController extends GetxController {
  static MyReportHistoryController get to => Get.find();

  RxList<ReportHistoryModel> processReportList = <ReportHistoryModel>[].obs;
  RxList<ReportHistoryModel> receivedReportList = <ReportHistoryModel>[].obs;
  RxList<ReportHistoryModel> completeReportList = <ReportHistoryModel>[].obs;

  @override
  void onInit() async {
    await inquiryHistoryInit();

    super.onInit();
  }

  Future<void> inquiryHistoryInit() async {
    List<ReportHistoryModel> reportHistoryModelList =
        await CustomerCenterRepository().getReportHistory();

    for (ReportHistoryModel reportHistoryModel in reportHistoryModelList) {
      if (reportHistoryModel.status == '신고 처리중') {
        processReportList.add(reportHistoryModel);
      } else if (reportHistoryModel.status == '접수 완료') {
        receivedReportList.add(reportHistoryModel);
      } else if (reportHistoryModel.status == '처리 완료') {
        completeReportList.add(reportHistoryModel);
      }
    }
  }
}
