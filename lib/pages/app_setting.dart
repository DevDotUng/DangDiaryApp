import 'package:dangdiarysample/components/custom_switch.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              width: 32.w,
              child: Icon(
                Icons.arrow_back,
                size: 32.r,
                color: Colors.black,
              ),
            ),
          ),
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
                  CustomSwitch(value: true),
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
                  CustomSwitch(value: true),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  CustomText(
                    text: '이벤트 알림',
                    color: Color(0xff222222),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 16),
                  ),
                  Expanded(
                    child: Container(height: 20, color: Colors.transparent),
                  ),
                  CustomSwitch(value: true),
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
