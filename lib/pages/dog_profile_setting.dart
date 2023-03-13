import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/controllers/dog_profile_setting_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DogProfileSetting extends StatelessWidget {
  const DogProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DogProfileSettingController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
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
            text: '댕댕 주민등록증 수정',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (28 / 20),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Stack(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            image: DecorationImage(
                              image: AssetImage('assets/dog.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: StaticColor.main,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: StaticIcon(
                                IconsPath.photo,
                                size: 18.r,
                                color: StaticColor.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      height: 8.h,
                      color: Color(0xffF5F5F5),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '반려견 이름',
                            color: Color(0xff6B6B6B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.w, right: 12.w),
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: TextField(
                          controller: DogProfileSettingController
                              .to.dogNameTextEditingController,
                          cursorColor: Colors.black,
                          cursorWidth: 1.w,
                          cursorHeight: 18.h,
                          style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 12.h),
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.edit,
                              size: 16.r,
                              color: Color(0xffA6A6A6),
                            ),
                            suffixIconConstraints: BoxConstraints(minHeight: 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '보호자 닉네임',
                            color: Color(0xff6B6B6B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        padding: EdgeInsets.only(left: 8.w, right: 12.w),
                        width: double.infinity,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Color(0xffD9D9D9)),
                        ),
                        child: TextField(
                          controller: DogProfileSettingController
                              .to.userNicknameTextEditingController,
                          cursorColor: Colors.black,
                          cursorWidth: 1.w,
                          cursorHeight: 18.h,
                          style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 12.h),
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.edit,
                              size: 16.r,
                              color: Color(0xffA6A6A6),
                            ),
                            suffixIconConstraints: BoxConstraints(minHeight: 0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '견종',
                            color: Color(0xff6B6B6B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: GestureDetector(
                        onTap: () => DogProfileSettingController.to
                            .showCupertinoBreedPicker(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Color(0xffD9D9D9)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => CustomText(
                                    text: DogProfileSettingController
                                        .to.breed.value,
                                    color: Color(0xff222222),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: (20 / 16),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16.r,
                                color: Color(0xffA6A6A6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '반려견 생년월일',
                            color: Color(0xff6B6B6B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: GestureDetector(
                        onTap: () => DogProfileSettingController.to
                            .showCupertinoBirthPicker(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Color(0xffD9D9D9)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => CustomText(
                                    text: DogProfileSettingController
                                        .to.birth.value,
                                    color: Color(0xff222222),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: (20 / 16),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16.r,
                                color: Color(0xffA6A6A6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '반려견 성별',
                            color: Color(0xff6B6B6B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                          SizedBox(width: 4.w),
                          Container(
                            width: 4.w,
                            height: 4.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: GestureDetector(
                        onTap: () => DogProfileSettingController.to
                            .showCupertinoGenderPicker(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(color: Color(0xffD9D9D9)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => CustomText(
                                    text: DogProfileSettingController
                                        .to.gender.value,
                                    color: Color(0xff222222),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: (20 / 16),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 16.r,
                                color: Color(0xffA6A6A6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 171.h),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: ReactiveDevice().hasHomeIndicator() ? 102.h : 68.h,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      width: double.infinity,
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Color(0xff7D7D7D),
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      child: Center(
                        child: CustomText(
                          text: '저장할게요',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
