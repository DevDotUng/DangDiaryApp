import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerCenter extends StatelessWidget {
  const CustomerCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
        title: CustomText(
          text: '고객센터',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: Get.width,
              height: Get.height * 0.4,
              color: Color(0xffD9D9D9),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.7 + 26.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: '공지사항',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.0.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/notice');
                          },
                          child: CustomText(
                            text: '전체 보기',
                            color: Color(0xff666666),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    padding: EdgeInsets.all(8.0.r),
                    width: double.infinity,
                    height: 82.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2022/00/00 ver.1.1',
                          style: TextStyle(
                            color: Color(0xffB8B8B8),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text:
                              '아 공지사항 공지사항입니다. 이러이러한 개선점이 있으니 참고하시기 바랍니다. 참고하라고^^',
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: (16 / 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
              width: Get.width,
              height: Get.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'FAQ',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 16),
                      ),
                      SizedBox(width: 12.w),
                      CustomText(
                        text: '사용자들이 자주 묻는 질문을 확인하세요.',
                        color: Color(0xff929292),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (24 / 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: CustomText(
                                text: '개발자님이 잘생겼다는데 사실인가요?',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (16 / 14),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.h,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '또다른 궁금한 내용이 있나요?',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 14),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Color(0xffA6A6A6),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: '1대1 문의',
                            color: Color(0xffA6A6A6),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 61.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
