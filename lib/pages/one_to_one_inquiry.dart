import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/one_to_one_inquiry_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OneToOneInquiry extends StatelessWidget {
  const OneToOneInquiry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OneToOneInquiryController(context: context));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const CustomBackButton(),
          ),
          title: CustomText(
            text: '1:1 문의하기',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (28 / 20),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '문의 유형을 선택해주세요',
                      color: Color(0xff545454),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: (32 / 18),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: StaticColor.sub_deeper,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => Row(
                    children: [
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[0],
                        0,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                      SizedBox(width: 8.w),
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[1],
                        1,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                      SizedBox(width: 8.w),
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[2],
                        2,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => Row(
                    children: [
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[3],
                        3,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                      SizedBox(width: 8.w),
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[4],
                        4,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                      SizedBox(width: 8.w),
                      _inquiryCategoryWidget(
                        OneToOneInquiryController.to.inquiryCategoryList[5],
                        5,
                        OneToOneInquiryController.to.inquiryCategoryIndex.value,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 56.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '문의 제목을 입력해 주세요',
                      color: Color(0xff545454),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: (32 / 18),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: StaticColor.sub_deeper,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller:
                      OneToOneInquiryController.to.titleTextEditingController,
                  maxLength: 16,
                  cursorColor: Colors.black,
                  cursorHeight: 18.h,
                  cursorWidth: 1.w,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: '제목을 입력해 주세요',
                    hintStyle: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    counter: Container(),
                    contentPadding: EdgeInsets.only(top: 8.h),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 8.w,
                      maxHeight: 7.h,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 56.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '문의 내용을 입력해 주세요',
                      color: Color(0xff545454),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: (32 / 18),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: BoxDecoration(
                        color: StaticColor.sub_deeper,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  height: 248.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    controller: OneToOneInquiryController
                        .to.contentTextEditingController,
                    maxLines: 15,
                    cursorColor: Colors.black,
                    cursorWidth: 1.w,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    decoration: InputDecoration(
                      hintText: '정확한 상담을 위해 자세히 작성 부탁드립니다.',
                      hintStyle: TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
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
                              text: '취소할게요',
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
                          OneToOneInquiryController.to.inquiry();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Color(0xff8BACFF),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '접수할게요',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              height: (32 / 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inquiryCategoryWidget(String text, int index, int currentIndex) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          OneToOneInquiryController.to.changeInquiryCategoryIndex(index);
        },
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: index == currentIndex ? Color(0xffA6A6A6) : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: index == currentIndex
                ? null
                : Border.all(
                    color: Color(0xffD9D9D9),
                  ),
          ),
          child: Center(
            child: CustomText(
              text: text,
              color: index == currentIndex ? Colors.white : Color(0xff545454),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
