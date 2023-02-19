import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyReportHistoryDetail extends StatelessWidget {
  const MyReportHistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
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
          text: '신고내역',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                color: Color(0xffF5F5F5),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 16.w),
                          Icon(
                            Icons.details,
                            size: 24.r,
                            color: Color(0xff202020),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomText(
                              text: '얼음물수영하기 일기를 신고했어요.',
                              color: Color(0xff222222),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              height: (24 / 16),
                            ),
                          ),
                          SizedBox(width: 16.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 16.w),
                          CustomText(
                            text: '신고사유 : 학대가 의심돼요.',
                            color: Color(0xff222222),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14),
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: '2023.01.17',
                            color: Color(0xff696969),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 12),
                          ),
                          SizedBox(width: 16.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Container(
                color: Color(0xffF5F5F5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Icon(
                            Icons.message,
                            size: 24.r,
                            color: Color(0xff6C8FDF),
                          ),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: '처리를 완료했어요.',
                            color: Color(0xff6C8FDF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomText(
                        text:
                            '안녕하세요 오또캐드님.\n운영진 ‘버찌’ 입니다.\n\n신고해주신 일기를 검토한 결과, 학대 정황이 의심되어 해당 유저의 계정을 이용 정지 처리했습니다.\n\n관심을 가지고 신고해주셔서 감사합니다.',
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (24 / 14),
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: '2023.01.17',
                        color: Color(0xff696969),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12),
                      ),
                      SizedBox(height: 61.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
