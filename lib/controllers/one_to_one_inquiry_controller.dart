import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OneToOneInquiryController extends GetxController {
  static OneToOneInquiryController get to => Get.find();
  late BuildContext context;
  OneToOneInquiryController({required this.context});

  List<String> inquiryCategoryList = [
    '일기장',
    '챌린지/스티커',
    '둘러보기',
    '계정 관리',
    '버그 신고',
    '기타',
  ];
  RxInt inquiryCategoryIndex = 6.obs;
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;

  @override
  void onInit() {
    titleTextEditingController = TextEditingController();
    contentTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    super.dispose();
  }

  void changeInquiryCategoryIndex(int index) {
    inquiryCategoryIndex(index);
  }

  void inquiry() async {
    if (inquiryCategoryIndex.value == 6) {
      failInquiry(context);
      return;
    } else if (titleTextEditingController.text.isEmpty) {
      failInquiry(context);
      return;
    } else if (contentTextEditingController.text.isEmpty) {
      failInquiry(context);
      return;
    }
    String type = inquiryCategoryList[inquiryCategoryIndex.value];
    String title = titleTextEditingController.text;
    String content = contentTextEditingController.text;

    int statusCode =
        await CustomerCenterRepository().inquiry(type, title, content);

    if (statusCode == 200) {
      Get.offAndToNamed('/completeInquiry');
    } else {
      failInquiry(context);
    }
  }

  void failInquiry(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    StaticIcon(
                      IconsPath.caution,
                      size: 24.r,
                      color: StaticColor.font_main,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '문제가 발생했어요!',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                  ],
                ),
                CustomText(
                  text: '문의 유형, 제목, 내용을 확인해주세요',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/illusts/exceed_images.png'),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(buildContext);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: StaticColor.main,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '넵',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
