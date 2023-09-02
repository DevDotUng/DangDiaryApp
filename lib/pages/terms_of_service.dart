import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({Key? key}) : super(key: key);

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
          text: '이용 약관',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            CustomText(
              text: '서비스 이용약관 및 개인정보 처리방침',
              color: Color(0xff6B6B6B),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: (20 / 14),
            ),
            SizedBox(height: 14.h),
            Container(
              width: double.infinity,
              height: 1.h,
              color: StaticColor.line,
            ),
            SizedBox(height: 13.h),
            GestureDetector(
              onTap: () {
                Get.toNamed('/webviewPage',
                    arguments: {'uri': 'https://www.youtube.com'});
              },
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: '개인정보 수집 및 이용동의',
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 16),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            GestureDetector(
              onTap: () {
                Get.toNamed('/webviewPage',
                    arguments: {'uri': 'https://www.youtube.com'});
              },
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: '이용약관 동의',
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 16),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27.h),
            GestureDetector(
              onTap: () {
                Get.toNamed('/webviewPage',
                    arguments: {'uri': 'https://www.youtube.com'});
              },
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: '광고성 정보 수신동의',
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 16),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
