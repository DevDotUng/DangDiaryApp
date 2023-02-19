import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyInquiryHistoryDetail extends StatelessWidget {
  const MyInquiryHistoryDetail({Key? key}) : super(key: key);

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
          text: '나의 문의 내역',
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
                          CustomText(
                            text: 'Q',
                            color: Color(0xff6C8FDF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomText(
                              text: '개발자가 잘생겼다는데 사실인가요?',
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
                            text:
                                '유니크원의 개발자가 잘생겼다고 들었는데 사실인가요? 진상규명 해주세요. 제가 알기론 디자이너들이 더 잘생겼다고 알고 있는데요.',
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
                            text: '저희가 답변해드릴게요!',
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
                            '안녕하세요 오또캐드님.\n운영진 ‘버찌’ 입니다.\n\n아시는 바와 같이 개발자들이 더 잘생겼습니다.\n\n관심을 가져주셔서 감사합니다.',
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
                      SizedBox(height: 40.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '도움이 되었나요?',
                            color: Color(0xff272727),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    print('잘 모르겠어요');
                                  },
                                  child: Container(
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: Color(0xffA6A6A6),
                                      ),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '잘 모르겠어요',
                                        color: Color(0xffA6A6A6),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (32 / 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    print('고마워요');
                                  },
                                  child: Container(
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                        color: Color(0xffA6A6A6),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 24.r,
                                          color: Color(0xff696969),
                                        ),
                                        SizedBox(width: 4.w),
                                        CustomText(
                                          text: '고마워요!',
                                          color: Color(0xffA6A6A6),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: (32 / 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
        ),
      ),
    );
  }
}
