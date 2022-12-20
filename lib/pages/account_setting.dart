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
        title: Text(
          '계정 관리',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
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
                  Text(
                    '사용자명',
                    style: TextStyle(
                      color: Color(0xff545454),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '오또캐드',
                    style: TextStyle(
                      color: Color(0xff545454),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
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
                  Text(
                    '아이디',
                    style: TextStyle(
                      color: Color(0xff545454),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'asdalk821',
                    style: TextStyle(
                      color: Color(0xff545454),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
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
                child: Text(
                  '카카오톡계정 정보',
                  style: TextStyle(
                    color: Color(0xff545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Color(0xffF02E2E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
                child: Text(
                  '아쉽지만 탈퇴할래요!',
                  style: TextStyle(
                    color: Color(0xffF02E2E),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
