import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB5C9FF),
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          text: 'MY',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications_active_outlined,
                size: 32.r,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Color(0xffB5C9FF),
                child: Container(
                  margin: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: StaticColor.white,
                      width: 1.5.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4.r,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    StaticIcon(
                                      IconsPath.customer_center,
                                      size: 24.r,
                                      color: Color(0xff545454),
                                    ),
                                    SizedBox(width: 4.w),
                                    CustomText(
                                      text: '댕댕 주민등록증',
                                      color: Color(0xff545454),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      height: (20 / 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '초코',
                                        color: Color(0xff222222),
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (32 / 24),
                                      ),
                                      SizedBox(width: 4.w),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        child: CustomText(
                                          text: '/ 오또캐드 보호자님',
                                          color: Color(0xff545454),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (20 / 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              image: DecorationImage(
                                image: AssetImage('assets/dog.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main_light,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        bottomLeft: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '견종',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (20 / 12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: CustomText(
                                          text: '비글',
                                          color: Color(0xff6B6B6B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (24 / 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 9.w),
                          Expanded(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main_light,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        bottomLeft: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '나이',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (20 / 12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: CustomText(
                                          text: '만 3세',
                                          color: Color(0xff6B6B6B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (24 / 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main_light,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        bottomLeft: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '성별',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (20 / 12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: CustomText(
                                          text: '수컷',
                                          color: Color(0xff6B6B6B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (24 / 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 9.w),
                          Expanded(
                            child: Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 48.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main_light,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        bottomLeft: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '생일',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (20 / 12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: CustomText(
                                          text: '2020.01.31',
                                          color: Color(0xff6B6B6B),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (24 / 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    StaticIcon(
                      IconsPath.customer_center,
                      size: 24.r,
                      color: Color(0xff202020),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '계정 관리',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: (20 / 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/dogProfileSetting');
                  },
                  child: Row(
                    children: [
                      CustomText(
                        text: '댕댕 주민등록증 수정',
                        color: Colors.black,
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
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/accountSetting');
                  },
                  child: Row(
                    children: [
                      CustomText(
                        text: '계정 정보',
                        color: Colors.black,
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
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                height: 8.h,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    StaticIcon(
                      IconsPath.setting,
                      size: 24.r,
                      color: Color(0xff202020),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '앱 관리',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: (20 / 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/appSetting');
                  },
                  child: Row(
                    children: [
                      CustomText(
                        text: '앱 설정',
                        color: Colors.black,
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
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/customerCenter');
                  },
                  child: Row(
                    children: [
                      CustomText(
                        text: '고객센터',
                        color: Colors.black,
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
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/myReportHistory');
                  },
                  child: Row(
                    children: [
                      CustomText(
                        text: '신고내역',
                        color: Colors.black,
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
              SizedBox(height: 171.h),
            ],
          ),
        ),
      ),
    );
  }
}
