import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/my_inquiry_history_controller.dart';
import 'package:dangdiarysample/models/customer_center/Inquiry_history_model.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyInquiryHistory extends StatelessWidget {
  const MyInquiryHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyInquiryHistoryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.sub_light,
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
                color: StaticColor.sub_light,
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
                        Obx(
                          () => CustomText(
                            text:
                                '${MyInquiryHistoryController.to.preparingForAnswerList.length + MyInquiryHistoryController.to.receivedList.length}건',
                            color: Color(0xff6C8FDF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => Column(
                        children: [
                          ...List.generate(
                            MyInquiryHistoryController
                                .to.preparingForAnswerList.length,
                            (index) => _inquiryWidget(MyInquiryHistoryController
                                .to.preparingForAnswerList[index]),
                          ),
                          ...List.generate(
                            MyInquiryHistoryController.to.receivedList.length,
                            (index) => _inquiryWidget(MyInquiryHistoryController
                                .to.receivedList[index]),
                          ),
                        ],
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
                        Obx(
                          () => CustomText(
                            text:
                                '${MyInquiryHistoryController.to.answerCompleteList.length}건',
                            color: Color(0xff696969),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => Column(
                        children: List.generate(
                          MyInquiryHistoryController
                              .to.answerCompleteList.length,
                          (index) => _inquiryWidget(MyInquiryHistoryController
                              .to.answerCompleteList[index]),
                        ),
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

  Widget _inquiryWidget(InquiryHistoryModel inquiryHistoryModel) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/myInquiryHistoryDetail',
            arguments: {'inquiryHistoryModel': inquiryHistoryModel});
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              height: 24.h,
              decoration: BoxDecoration(
                  color: _getColor(inquiryHistoryModel.progress),
                  borderRadius: BorderRadius.circular(10.r),
                  border: inquiryHistoryModel.progress == '접수 완료'
                      ? Border.all(color: StaticColor.sub_deeper)
                      : null),
              child: Center(
                child: Text(
                  inquiryHistoryModel.progress,
                  style: TextStyle(
                    color: inquiryHistoryModel.progress == '접수 완료'
                        ? StaticColor.sub_deeper
                        : Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                inquiryHistoryModel.title,
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
    );
  }

  Widget progressBanner(String progress) {
    if (progress == '답변 준비중') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: 24.h,
        decoration: BoxDecoration(
          color: _getColor(progress),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            progress,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else if (progress == '접수 완료') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: 24.h,
        decoration: BoxDecoration(
          color: _getColor(progress),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            progress,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else if (progress == '답변 완료') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: 24.h,
        decoration: BoxDecoration(
          color: _getColor(progress),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            progress,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color _getColor(String progress) {
    switch (progress) {
      case '답변 준비중':
        return StaticColor.sub_deeper;
      case '접수 완료':
        return StaticColor.white;
      case '답변 완료':
        return Color(0xffA6A6A6);
      default:
        return Color(0xffA6A6A6);
    }
  }
}
