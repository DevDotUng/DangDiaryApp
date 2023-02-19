import 'package:dangdiarysample/models/customer_center/faq_model.dart';
import 'package:dangdiarysample/models/customer_center/notice_model.dart';

class CustomerCenterModel {
  CustomerCenterModel({
    required this.notices,
    required this.FAQs,
  });

  List<NoticeModel> notices;
  List<FAQModel> FAQs;

  factory CustomerCenterModel.fromJson(Map<String, dynamic> json) {
    return CustomerCenterModel(
      notices: List<NoticeModel>.from(
          json['notices'].map((data) => NoticeModel.fromJson(data))),
      FAQs: List<FAQModel>.from(
          json['FAQs'].map((data) => FAQModel.fromJson(data))),
    );
  }
}
