import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/report_dropdown_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportDetail extends StatelessWidget {
  const ReportDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          text: '신고내역',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Icon(
              Icons.camera,
              size: 21.r,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: CustomText(
                text: '오또캐드님의 신고내역',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: (24 / 14),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ReportDropdownContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
