import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/models/customer_center/report_history_model.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyReportHistoryDetail extends StatelessWidget {
  const MyReportHistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportHistoryModel _reportHistoryModel =
        Get.arguments['reportHistoryModel'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CustomBackButton(),
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
                          StaticIcon(
                            IconsPath.caution,
                            size: 24.r,
                            color: Color(0xff202020),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomText(
                              text: _reportHistoryModel.title,
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
                            text: '신고사유 : ' + _reportHistoryModel.reason,
                            color: Color(0xff222222),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14),
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: getFormattedDate(
                                _reportHistoryModel.createDate),
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
                          StaticIcon(
                            IconsPath.consult,
                            size: 24.r,
                            color: StaticColor.sub_deeper,
                          ),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: getAnswerTitle(_reportHistoryModel.status),
                            color: Color(0xff6C8FDF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomText(
                        text: getAnswer(_reportHistoryModel.status,
                            _reportHistoryModel.answer),
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
                      ),
                      SizedBox(height: 8.h),
                      _reportHistoryModel.modifyDate == null
                          ? Container()
                          : CustomText(
                              text: getFormattedDate(
                                  _reportHistoryModel.modifyDate),
                              color: Color(0xff696969),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: (20 / 12),
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

  String getFormattedDate(String? date) {
    DateTime dateTime = DateTime.now();
    if (date != null) {
      dateTime = DateTime.parse(date);
    }

    String formattedDate = DateFormat('yyyy.MM.dd').format(dateTime);

    return formattedDate;
  }

  String getAnswerTitle(String status) {
    if (status == '신고 처리중') {
      return '신고를 확인하고 처리중이에요!';
    } else if (status == '접수 완료') {
      return '접수가 완료되었어요.';
    } else if (status == '답변 완료') {
      return '처리를 완료했어요.';
    } else {
      return '';
    }
  }

  String getAnswer(String status, String? answer) {
    if (answer != null) {
      return answer;
    }
    if (status == '신고 처리중') {
      return '정황을 파악하고 규정에 따라 조치 여부를 논의하고 있는 중이에요. 답변을 드리기까지 약 2~3일정도 소요됩니다.\n답변 완료 시, \'메인 홈 > 알림 센터\' 또는 \'고객센터 > 공지사항\'에서 알려 드릴게요!';
    } else if (status == '접수 완료') {
      return '접수된 신고를 선착순으로 확인하고 있어요.\n답변을 드리기까지 약 2~3일정도 소요됩니다.\n답변 완료 시, \'메인 홈 > 알림 센터\' 또는 \'고객센터 > 공지사항\'에서 알려 드릴게요!';
    } else {
      return '';
    }
  }
}
