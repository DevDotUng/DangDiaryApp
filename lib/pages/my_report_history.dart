import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyReportHistory extends StatelessWidget {
  const MyReportHistory({Key? key}) : super(key: key);

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
                    Row(
                      children: [
                        CustomText(
                          text: '진행중인 문의 ',
                          color: Color(0xff272727),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                        CustomText(
                          text: '3건',
                          color: StaticColor.error,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      children: List.generate(
                        3,
                        (index) =>
                            _reportWidget('신고 처리중', '바람과함께춤을 일기를 신고했어요.'),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        CustomText(
                          text: '답변 완료된 문의 ',
                          color: Color(0xff272727),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                        CustomText(
                          text: '2건',
                          color: Color(0xff696969),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      children: List.generate(
                        2,
                        (index) => _reportWidget('처리 완료', '얼음물수영하기 일기를 신고했어요.'),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportWidget(String status, String title) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/myReportHistoryDetail');
      },
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Color(0xffEAEAEA),
          ),
        ),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 16.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                height: 24.h,
                decoration: BoxDecoration(
                  color: _getColor(status),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff222222),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20.r,
                color: Color(0xffA6A6A6),
              ),
              SizedBox(width: 18.w),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(String status) {
    switch (status) {
      case '신고 처리중':
        return StaticColor.error;
      case '접수 완료':
        return Color(0xffD9E2FF);
      case '처리 완료':
        return StaticColor.link;
      default:
        return StaticColor.error;
    }
  }
}
