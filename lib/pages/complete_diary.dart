import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteDiary extends StatelessWidget {
  const CompleteDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            CustomText(
              text:
                  '축하해요!\n${DiariesController.to.myDiariesModel.value!.dogName}가 <${Get.arguments['title']}>의\n칭찬스티커를 받았어요!',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: (32 / 24),
            ),
            SizedBox(height: 54.h),
            Expanded(
              child: Container(
                width: Get.width - 48.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/illusts/complete_diary.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                onTap: () {
                  Get.offAndToNamed('/diary', arguments: {
                    'coverId': Get.arguments['completeDiaryModel'].coverId,
                    'diaryId': Get.arguments['completeDiaryModel'].diaryId,
                  });
                  BottomNavController.to.changeBottomNav(1);
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: StaticColor.main,
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: '댕뿌듯',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.until((route) => Get.currentRoute == '/app');
                  BottomNavController.to.changeBottomNav(1);
                },
                child: CustomText(
                  text: '일기장으로 이동할래요',
                  color: StaticColor.link,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 12),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 72.h),
          ],
        ),
      ),
    );
  }
}
