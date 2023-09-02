import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

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
          text: '계정 정보',
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
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomText(
                text: '현재 로그인한 계정',
                color: Color(0xff6B6B6B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: (20 / 14),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(0xffFEE500),
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              height: 8.h,
              color: Color(0xffF5F5F5),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/termsOfService');
              },
              child: Column(
                children: [
                  Container(
                    height: 24.h,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        CustomText(
                          text: '이용 약관',
                          color: Color(0xff222222),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 16),
                        ),
                        Expanded(
                          child:
                              Container(height: 20, color: Colors.transparent),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16.r,
                          color: Color(0xffA6A6A6),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 24.h,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8.h,
              color: Color(0xffF5F5F5),
            ),
            GestureDetector(
              onTap: () {
                _showLogoutDialog(context);
              },
              child: Column(
                children: [
                  Container(
                    height: 24.h,
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        CustomText(
                          text: '로그아웃',
                          color: Color(0xff222222),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 16),
                        ),
                        Expanded(
                          child:
                              Container(height: 20, color: Colors.transparent),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16.r,
                          color: Color(0xffA6A6A6),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 24.h,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 8.h,
              color: Color(0xffF5F5F5),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/accountDelete');
                },
                child: Row(
                  children: [
                    CustomText(
                      text: '계정 삭제',
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 16),
                    ),
                    Expanded(
                      child: Container(height: 20, color: Colors.transparent),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16.r,
                      color: Color(0xffA6A6A6),
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40.h),
                CustomText(
                  text: '로그아웃 하시겠어요?',
                  color: Color(0xff000000),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: (24 / 20),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 1.h,
                  color: Color(0xffF5F5F5),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                '아니요',
                                style: TextStyle(
                                  color: Color(0xffA6A6A6),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1.h,
                        height: double.infinity,
                        color: Color(0xffF5F5F5),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            int statusCode = await LoginRepository().logout();
                            if (statusCode == 200) {
                              Box homeBox = await Hive.openBox('userInfo');
                              homeBox.put('userId', null);
                              Get.offAllNamed('/login');
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                '네',
                                style: TextStyle(
                                  color: Color(0xffF02E2E),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
