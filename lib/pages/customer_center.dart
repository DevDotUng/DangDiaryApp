import 'package:dangdiarysample/components/auto_loop_scroll_view.dart';
import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/customer_center_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerCenter extends StatelessWidget {
  const CustomerCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerCenterController());
    return Obx(
      () => CustomerCenterController.to.customerCenter.value == null
          ? Container(color: Colors.white)
          : _customerCenterWidget(),
    );
  }

  Widget _customerCenterWidget() {
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
          child: const CustomBackButton(),
        ),
        title: CustomText(
          text: '고객센터',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: Get.width,
              height: Get.height * 0.4,
              color: StaticColor.sub_light,
            ),
          ),
          Positioned(
            bottom: Get.height * 0.756 + 32.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/notice');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      StaticIcon(
                        IconsPath.report,
                        size: 24.r,
                        color: StaticColor.sub_deeper,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: AutoLoopScrollView(
                          duration: Duration(seconds: 100),
                          scrollDirection: Axis.horizontal,
                          child: CustomerCenterController.to.customerCenter
                                      .value?.notices.length ==
                                  0
                              ? CustomText(
                                  text: '[공지]',
                                  color: Color(0xff272727),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1,
                                )
                              : CustomText(
                                  text:
                                      '[공지] ${CustomerCenterController.to.customerCenter.value!.notices[0].title}',
                                  color: Color(0xff272727),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  maxLines: 1,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
              width: Get.width,
              height: Get.height * 0.756,
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
                        color: Color(0xff272727),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (32 / 20),
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '사용자들이 자주 묻는 질문을 확인하세요.',
                        color: Color(0xff696969),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            CustomerCenterController
                                .to.customerCenter.value!.FAQs.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/faq',
                                      arguments: {'index': index});
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text: CustomerCenterController
                                            .to
                                            .customerCenter
                                            .value!
                                            .FAQs[index]
                                            .question,
                                        color: Color(0xff222222),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (20 / 14),
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 16.r,
                                      color: Color(0xffA6A6A6),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '원하는 답변을 찾을 수 없나요?',
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
                                        Get.toNamed('oneToOneInquiry');
                                      },
                                      child: Container(
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: Color(0xffA6A6A6),
                                          ),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: '1:1 문의하기',
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
                                        Get.toNamed('myInquiryHistory');
                                      },
                                      child: Container(
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: Color(0xffA6A6A6),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            StaticIcon(
                                              IconsPath.consult,
                                              size: 24.r,
                                              color: Color(0xff696969),
                                            ),
                                            SizedBox(width: 4.w),
                                            CustomText(
                                              text: '나의 문의 내역',
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
        ],
      ),
    );
  }
}
