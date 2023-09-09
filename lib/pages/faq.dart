import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/customer_center_controller.dart';
import 'package:dangdiarysample/repositories/customer_center_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool? isLike = CustomerCenterController
      .to.customerCenter.value!.FAQs[Get.arguments['index']].isLike;

  void likeFAQ(int faqId, bool isLikeArgument) async {
    int statusCode =
        await CustomerCenterRepository().likeFAQ(faqId, isLikeArgument);

    if (statusCode == 200) {
      setState(() {
        isLike = isLikeArgument;
      });
      CustomerCenterController.to.loading();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              text: CustomerCenterController.to.customerCenter
                                  .value!.FAQs[Get.arguments['index']].question,
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
                    SizedBox(height: 32.h),
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
                        text: CustomerCenterController.to.customerCenter.value!
                            .FAQs[Get.arguments['index']].answer,
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
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
                                    likeFAQ(
                                        CustomerCenterController
                                            .to
                                            .customerCenter
                                            .value!
                                            .FAQs[Get.arguments['index']]
                                            .FAQId,
                                        false);
                                  },
                                  child: Container(
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: isLike == null || isLike!
                                          ? StaticColor.white
                                          : StaticColor.sub_deeper,
                                      borderRadius: BorderRadius.circular(10.r),
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
                                    likeFAQ(
                                        CustomerCenterController
                                            .to
                                            .customerCenter
                                            .value!
                                            .FAQs[Get.arguments['index']]
                                            .FAQId,
                                        true);
                                  },
                                  child: Container(
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: isLike == null || !isLike!
                                          ? StaticColor.white
                                          : StaticColor.like,
                                      borderRadius: BorderRadius.circular(10.r),
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
                                                color: StaticColor.link,
                                              )
                                            : StaticIcon(
                                                IconsPath.like,
                                                size: 24.r,
                                                color: Color(0xffFFFFFF),
                                              ),
                                        SizedBox(width: 4.w),
                                        CustomText(
                                          text: '고마워요!',
                                          color: isLike == null || !isLike!
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
                          isLike == null
                              ? Container()
                              : Column(
                                  children: [
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (!isLike!) {
                                              Get.toNamed('/oneToOneInquiry');
                                            }
                                          },
                                          child: CustomText(
                                            text: isLike!
                                                ? '감사합니다. 보내주신 의견은 서비스 개선에 도움이 됩니다.'
                                                : '1:1문의하러 가기',
                                            color: Color(0xff6B6B6B),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (20 / 12),
                                            decoration: isLike!
                                                ? null
                                                : TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                          SizedBox(height: 61.h),
                        ],
                      )
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
