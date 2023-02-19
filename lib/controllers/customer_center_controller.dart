import 'package:dangdiarysample/models/customer_center/customer_center_model.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:get/get.dart';

class CustomerCenterController extends GetxController {
  static CustomerCenterController get to => Get.find();

  final customerCenter = Rxn<CustomerCenterModel>();
  List<String> FAQs = [
    '반려견 이름은 어떻게 바꾸나요?',
    '보호자 닉네임은 어떻게 바꾸나요?',
    '‘다했어요’ 버튼 클릭 후 일기를 쓰지 않아도 되나요?',
    '일기를 쓰다가 실수로 어플을 종료했어요.',
    '임시 저장된 일기는 어디서 확인할 수 있나요?',
    '내 일기를 비공개하고 싶어요!',
    '실수로 다이어리(일기)를 삭제했어요.',
    '다이어리 제목을 수정하고 싶어요!',
    '일기 내용을 수정하고 싶어요!',
    '미획득 스티커는 어떻게 얻을 수 있나요?',
  ];

  @override
  void onInit() {
    loading();
    super.onInit();
  }

  Future<void> loading() async {
    CustomerCenterModel customerCenterModel =
        await CustomerCenterRepository().getCustomerCenterView();
    customerCenter(customerCenterModel);
  }
}
