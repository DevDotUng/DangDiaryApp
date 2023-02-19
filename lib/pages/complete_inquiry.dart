import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompleteInquiry extends StatelessWidget {
  const CompleteInquiry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            CustomText(
              text: '접수가 완료되었어요!',
              color: Color(0xff8BACFF),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: (32 / 24),
            ),
            CustomText(
              text: '꼼꼼히 확인 후',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: (32 / 24),
            ),
            CustomText(
              text: '빠른 시일 내로 답변드릴게요',
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: (32 / 24),
            ),
            Expanded(
              child: SizedBox(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: Get.width - 48.w),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/sticker.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xff7D7D7D),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: CustomText(
                    text: '알겠어요',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: '나의 문의 내역 페이지로 이동할래요',
                  color: Color(0xff6B6B6B),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 12),
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
