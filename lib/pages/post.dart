import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String postContent =
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 ';
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
          text: '둘러보기',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16).h,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8.w),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      CustomText(
                        text: '오또캐드',
                        color: Color(0xff1D1D1D),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12).h,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '초코',
                        color: Color(0xff1D1D1D),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12).h,
                      ),
                      SizedBox(width: 2.w),
                      Icon(Icons.male, size: 10.r),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '초코와 술래잡기',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: (20 / 16).h,
                      ),
                      CustomText(
                        text: '서울 성북구 유니크원 카페',
                        color: Color(0xff7E7E7E),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: '2022년 9월 11일 월요일',
                            color: Color(0xff1D1D1D),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 12).h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.wb_sunny_outlined, size: 16.r),
                              SizedBox(width: 8.w),
                              Icon(Icons.sentiment_very_satisfied_sharp,
                                  size: 16.r),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 380.h,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            flex: 207,
                            child: Container(
                              width: 100.w,
                              height: 43.h,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 8.w),
                                  Icon(Icons.golf_course, size: 16.r),
                                  SizedBox(width: 8.w),
                                  CustomText(
                                    text: '애견카페 방문기 작성하기',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: (24 / 14).h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 96,
                            child: Container(
                              width: 100.w,
                              height: 43.h,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.heart_broken, size: 18.r),
                                  CustomText(
                                    text: '119',
                                    color: Color(0xff1D1D1D),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: postContent,
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14).h,
                      ),
                      SizedBox(height: 53.h),
                    ],
                  ),
                ),
                SizedBox(height: 38.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
