import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 32.r,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: '계정 관리',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16).h,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 32.w),
              width: double.infinity,
              height: 36.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '사용자명',
                    color: Color(0xff545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: (24 / 14).h,
                  ),
                  CustomText(
                    text: '오또캐드',
                    color: Color(0xff545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: (24 / 14).h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.h),
            Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              width: double.infinity,
              height: 36.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '아이디',
                    color: Color(0xff545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: (24 / 14).h,
                  ),
                  CustomText(
                    text: 'asdalk821',
                    color: Color(0xff545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: (24 / 14).h,
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.h),
            Container(
              width: double.infinity,
              height: 78.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: CustomText(
                  text: '카카오톡계정 정보',
                  color: Color(0xff545454),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: (24 / 14).h,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Color(0xffF02E2E),
                ),
              ),
              child: Center(
                child: CustomText(
                  text: '로그아웃',
                  color: Color(0xffF02E2E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: (32 / 16).h,
                ),
              ),
            ),
            SizedBox(height: 9.h),
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Color(0xffF02E2E),
                ),
              ),
              child: Center(
                child: CustomText(
                  text: '아쉽지만 탈퇴할래요!',
                  color: Color(0xffF02E2E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: (32 / 16).h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
