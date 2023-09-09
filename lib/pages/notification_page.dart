import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomBackButton(),
        ),
        title: Text(
          '알림',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: Border(
          bottom: BorderSide(color: Color(0xffD9D9D9)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 8.h),
                Container(
                  constraints: BoxConstraints(minHeight: 47.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 24.w),
                      Expanded(
                        child: CustomText(
                          text: '제리야놀자님이 오또캐드님의 2022년 7월 8일 일기에 좋아요를 남겼어요.',
                          color: Color(0xff545454),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      CustomText(
                        text: '1분 전',
                        color: Color(0xff7D7D7D),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12),
                      ),
                      SizedBox(width: 24.w),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 1.h,
                  color: Color(0xffF5F5F5),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
