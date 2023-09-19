import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_switch.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/my_page_controller.dart';
import 'package:dangdiarysample/models/my_page/agree_model.dart';
import 'package:dangdiarysample/repositories/my_page_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  void agree(String type) async {
    AgreeModel agreeModel = await MyPageRepository().editAgree(type);
    MyPageController.to.myPageModel.value!.agreeLikeNotification =
        agreeModel.agreeLikeNotification;
    MyPageController.to.myPageModel.value!.agreeChallengeNotification =
        agreeModel.agreeChallengeNotification;
    MyPageController.to.myPageModel.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CustomBackButton(),
        ),
        title: CustomText(
          text: '앱 설정',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  CustomText(
                    text: '전체 푸시알림',
                    color: Color(0xff222222),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 16),
                  ),
                  Expanded(
                    child: Container(height: 20, color: Colors.transparent),
                  ),
                  GestureDetector(
                    onTap: () {
                      agree('all');
                    },
                    child: Obx(
                      () => CustomSwitch(
                        value: MyPageController
                                .to.myPageModel.value!.agreeLikeNotification ||
                            MyPageController.to.myPageModel.value!
                                .agreeChallengeNotification,
                        onColor: StaticColor.sub_deeper,
                        offColor: StaticColor.icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  CustomText(
                    text: '좋아요 알림',
                    color: Color(0xff222222),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 16),
                  ),
                  Expanded(
                    child: Container(height: 20, color: Colors.transparent),
                  ),
                  GestureDetector(
                    onTap: () {
                      agree('like');
                    },
                    child: Obx(
                      () => CustomSwitch(
                        value: MyPageController
                            .to.myPageModel.value!.agreeLikeNotification,
                        onColor: StaticColor.sub_deeper,
                        offColor: StaticColor.icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  CustomText(
                    text: '챌린지 알림',
                    color: Color(0xff222222),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 16),
                  ),
                  Expanded(
                    child: Container(height: 20, color: Colors.transparent),
                  ),
                  GestureDetector(
                    onTap: () {
                      agree('challenge');
                    },
                    child: Obx(
                      () => CustomSwitch(
                        value: MyPageController
                            .to.myPageModel.value!.agreeChallengeNotification,
                        onColor: StaticColor.sub_deeper,
                        offColor: StaticColor.icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Container(
              width: double.infinity,
              height: 8.h,
              color: Color(0xffF5F5F5),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    CustomText(
                      text: '앱 버전 정보',
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 16),
                    ),
                    Expanded(
                      child: Container(height: 20, color: Colors.transparent),
                    ),
                    CustomText(
                      text: '1.01',
                      color: Color(0xff6B6B6B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
