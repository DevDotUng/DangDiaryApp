import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/my_inquiry_history_controller.dart';
import 'package:dangdiarysample/models/customer_center/Inquiry_history_model.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyInquiryHistoryDetail extends StatefulWidget {
  const MyInquiryHistoryDetail({Key? key}) : super(key: key);

  @override
  State<MyInquiryHistoryDetail> createState() => _MyInquiryHistoryDetailState();
}

class _MyInquiryHistoryDetailState extends State<MyInquiryHistoryDetail> {
  bool? isLike = Get.arguments['inquiryHistoryModel'].isLike;

  void likeInquiry(int inquiryId, bool isLikeArgument) async {
    int statusCode =
        await CustomerCenterRepository().likeInquiry(inquiryId, isLikeArgument);

    if (statusCode == 200) {
      setState(() {
        isLike = isLikeArgument;
      });
      MyInquiryHistoryController.to.inquiryHistoryInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    InquiryHistoryModel _inquiryHistoryModel =
        Get.arguments['inquiryHistoryModel'];
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
                          CustomText(
                            text: 'Q',
                            color: Color(0xff6C8FDF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomText(
                              text: _inquiryHistoryModel.title,
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
                            text: _inquiryHistoryModel.content,
                            color: Color(0xff222222),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14),
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: getFormattedDate(
                                _inquiryHistoryModel.registerDate),
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
                            text: getAnswerTitle(_inquiryHistoryModel.progress),
                            color: Color(0xff6C8FDF),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomText(
                        text: getAnswer(_inquiryHistoryModel.progress,
                            _inquiryHistoryModel.answer),
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
                      ),
                      SizedBox(height: 8.h),
                      _inquiryHistoryModel.answerDate == null
                          ? Container()
                          : CustomText(
                              text: getFormattedDate(
                                  _inquiryHistoryModel.answerDate),
                              color: Color(0xff696969),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: (20 / 12),
                            ),
                      SizedBox(height: 40.h),
                      _inquiryHistoryModel.progress == '답변 완료'
                          ? Column(
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
                                          likeInquiry(
                                              _inquiryHistoryModel.inquiryId,
                                              false);
                                        },
                                        child: Container(
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            color: isLike == null || isLike!
                                                ? StaticColor.white
                                                : StaticColor.sub_deeper,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            border: isLike == null || isLike!
                                                ? Border.all(
                                                    color: Color(0xffA6A6A6),
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: CustomText(
                                              text: '잘 모르겠어요',
                                              color: isLike == null || isLike!
                                                  ? Color(0xffA6A6A6)
                                                  : StaticColor.white,
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
                                          likeInquiry(
                                              _inquiryHistoryModel.inquiryId,
                                              true);
                                        },
                                        child: Container(
                                          height: 48.h,
                                          decoration: BoxDecoration(
                                            color: isLike == null || !isLike!
                                                ? StaticColor.white
                                                : StaticColor.like,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            border: isLike == null || !isLike!
                                                ? Border.all(
                                                    color: Color(0xffA6A6A6),
                                                  )
                                                : null,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              isLike == null || !isLike!
                                                  ? StaticIcon(
                                                      IconsPath.like_outlined,
                                                      size: 24.r,
                                                      color: Color(0xff6B6B6B),
                                                    )
                                                  : StaticIcon(
                                                      IconsPath.like,
                                                      size: 24.r,
                                                      color: Color(0xffFFFFFF),
                                                    ),
                                              SizedBox(width: 4.w),
                                              CustomText(
                                                text: '고마워요!',
                                                color:
                                                    isLike == null || !isLike!
                                                        ? Color(0xffA6A6A6)
                                                        : StaticColor.white,
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
                            )
                          : Container(),
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

  String getAnswerTitle(String progress) {
    if (progress == '답변 준비중') {
      return '아직 답변 준비중이에요!';
    } else if (progress == '접수 완료') {
      return '접수가 완료되었어요.';
    } else if (progress == '답변 완료') {
      return '저희가 답변해드릴게요!';
    } else {
      return '';
    }
  }

  String getAnswer(String progress, String? answer) {
    if (answer != null) {
      return answer;
    }
    if (progress == '답변 준비중') {
      return '보호자님의 문제를 해결하기 위해 열심히 고민하고 있어요.\n답변을 드리기까지 약 2~3일정도 소요됩니다.\n답변 완료 시, \'메인 홈 > 알림 센터\' 또는 \'고객센터 > 공지사항\'에서 알려 드릴게요!';
    } else if (progress == '접수 완료') {
      return '접수된 문의를 선착순으로 확인하고 있어요.\n답변을 드리기까지 약 2~3일정도 소요됩니다.\n답변 완료 시, \'메인 홈 > 알림 센터\' 또는 \'고객센터 > 공지사항\'에서 알려 드릴게요!';
    } else {
      return '';
    }
  }
}
