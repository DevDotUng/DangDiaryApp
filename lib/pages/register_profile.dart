import 'dart:io';

import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/register_profile_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

class RegisterProfile extends StatelessWidget {
  const RegisterProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterProfileController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Obx(
            () => RegisterProfileController.to.pageIndex.value == 0
                ? Container()
                : GestureDetector(
                    onTap: () {
                      RegisterProfileController.to.previousPage();
                    },
                    child: const CustomBackButton(),
                  ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: StaticColor.line2,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: (Get.width - 48) /
                                5 *
                                (RegisterProfileController.to.pageIndex.value +
                                    1),
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Obx(
                    () => IndexedStack(
                      index: RegisterProfileController.to.pageIndex.value,
                      children: [
                        _dogNamePage(context),
                        _dogBreedAndGenderPage(context),
                        _dogBirthPage(context),
                        _userNamePage(context),
                        _confirmProfile(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 46.h,
                left: 0,
                right: 0,
                child: Obx(
                  () => IndexedStack(
                    index: RegisterProfileController.to.pageIndex.value,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!RegisterProfileController
                              .to.isBlankDogName.value) {
                            RegisterProfileController.to.nextPage();
                          }
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: RegisterProfileController
                                    .to.isBlankDogName.value
                                ? Color(0xffD2D2D2)
                                : StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '다음',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          RegisterProfileController.to.nextPage();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '다음',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          RegisterProfileController.to.nextPage();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '다음',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!RegisterProfileController
                              .to.isBlankUserName.value) {
                            RegisterProfileController.to.nextPage();
                          }
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: RegisterProfileController
                                    .to.isBlankUserName.value
                                ? Color(0xffD2D2D2)
                                : StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '다음',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          RegisterProfileController.to.nextPage();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '추억 쌓으러 가기',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
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
      ),
    );
  }

  Widget _dogNamePage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text: '댕댕일기를 이용하려면\n반려견의 주민등록증을 만들어야해요!',
            color: Color(0xff545454),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (32 / 20),
          ),
        ),
        SizedBox(height: 24.h),
        _profileImageWidget(context),
        SizedBox(height: 32.h),
        Row(
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
                color: StaticColor.main,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.only(left: 8.w, right: 12.w),
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Color(0xffD9D9D9)),
          ),
          child: TextField(
            controller:
                RegisterProfileController.to.dogNameTextEditingController,
            onChanged: (String text) {
              RegisterProfileController.to.changeDogNameBlank(text);
            },
            cursorColor: Colors.black,
            cursorWidth: 1.w,
            cursorHeight: 18.h,
            style: TextStyle(
              color: Color(0xff222222),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: '반려견의 이름을 입력하세요',
              hintStyle: TextStyle(
                color: StaticColor.line,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: EdgeInsets.only(bottom: 12.h),
              border: InputBorder.none,
              suffixIcon: StaticIcon(
                IconsPath.write_bold,
                size: 16.r,
                color: Color(0xffA6A6A6),
              ),
              suffixIconConstraints: BoxConstraints(minHeight: 0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dogBreedAndGenderPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text:
                '댕댕일기는 ${RegisterProfileController.to.dogNameTextEditingController.text}를 환영해요.\n좀 더 자세한 정보를 알려줄래요?',
            color: Color(0xff545454),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (32 / 20),
          ),
        ),
        SizedBox(height: 24.h),
        _profileImageWidget(context),
        SizedBox(height: 32.h),
        Row(
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
                color: StaticColor.main,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () {
            RegisterProfileController.to.pickBreed(context);
          },
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
                  child: CustomText(
                    text: RegisterProfileController.to.breed.value == ''
                        ? '견종을 검색해보세요'
                        : RegisterProfileController.to.breed.value,
                    color: RegisterProfileController.to.breed.value == ''
                        ? StaticColor.line
                        : Color(0xff222222),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    height: (20 / 16),
                  ),
                ),
                StaticIcon(
                  IconsPath.search,
                  size: 20.r,
                  color: Color(0xffA6A6A6),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Row(
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
                color: StaticColor.main,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () =>
              RegisterProfileController.to.showCupertinoGenderPicker(context),
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
                      text: RegisterProfileController.to.gender.value,
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: -pi * 1.5,
                  child: StaticIcon(
                    IconsPath.forward,
                    size: 16.r,
                    color: Color(0xffA6A6A6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _dogBirthPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text:
                '거의 다 만들었어요.\n${RegisterProfileController.to.userNameTextEditingController.text}의 생일이 언젠지 궁금해요.',
            color: Color(0xff545454),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (32 / 20),
          ),
        ),
        SizedBox(height: 24.h),
        _profileImageWidget(context),
        SizedBox(height: 32.h),
        Row(
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
                color: StaticColor.main,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () =>
              RegisterProfileController.to.showCupertinoBirthPicker(context),
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
                      text: RegisterProfileController.to.birth.value,
                      color: Color(0xff222222),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: -pi * 1.5,
                  child: StaticIcon(
                    IconsPath.forward,
                    size: 16.r,
                    color: Color(0xffA6A6A6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _userNamePage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text: '댕댕일기를 이용하려면\n반려견의 주민등록증을 만들어야해요!',
            color: Color(0xff545454),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (32 / 20),
          ),
        ),
        SizedBox(height: 24.h),
        _profileImageWidget(context),
        SizedBox(height: 32.h),
        Row(
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
                color: StaticColor.main,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.only(left: 8.w, right: 12.w),
          width: double.infinity,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Color(0xffD9D9D9)),
          ),
          child: TextField(
            controller:
                RegisterProfileController.to.userNameTextEditingController,
            onChanged: (String text) {
              RegisterProfileController.to.changeUserNameBlank(text);
            },
            cursorColor: Colors.black,
            cursorWidth: 1.w,
            cursorHeight: 18.h,
            style: TextStyle(
              color: Color(0xff222222),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: '보호자 닉네임을 입력하세요',
              hintStyle: TextStyle(
                color: StaticColor.line,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: EdgeInsets.only(bottom: 12.h),
              border: InputBorder.none,
              suffixIcon: StaticIcon(
                IconsPath.write_bold,
                size: 20.r,
                color: Color(0xffA6A6A6),
              ),
              suffixIconConstraints: BoxConstraints(minHeight: 0),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Color(0xff7D7D7D),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 12).h,
                ),
                children: <TextSpan>[
                  TextSpan(text: '입력한 정보들은 '),
                  TextSpan(
                    text: '\'MY > 댕댕 주민등록 수정\'',
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 12).h,
                    ),
                  ),
                  TextSpan(text: ' 탭에서\n                 언제든 변경이 가능합니다.'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _confirmProfile() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text: '드디어 주민등록증 완성이에요!\n이제 일기를 쓰러 가볼까요?',
            color: Color(0xff545454),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (32 / 20),
          ),
        ),
        SizedBox(height: 90.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: StaticColor.white,
              width: 1.5.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4.r,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            StaticIcon(
                              IconsPath.customer_center,
                              size: 24.r,
                              color: Color(0xff545454),
                            ),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: '댕댕 주민등록증',
                              color: Color(0xff545454),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: (20 / 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: RegisterProfileController
                                    .to.dogNameTextEditingController.text,
                                color: Color(0xff222222),
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                height: (32 / 24),
                              ),
                              SizedBox(width: 4.w),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: CustomText(
                                  text:
                                      '/ ${RegisterProfileController.to.userNameTextEditingController.text} 보호자님',
                                  color: Color(0xff545454),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (20 / 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      image: RegisterProfileController.to.profileImage.value ==
                              null
                          ? DecorationImage(
                              image: AssetImage(
                                  'assets/default_profile_image.png'),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: FileImage(
                                File(RegisterProfileController
                                    .to.profileImage.value!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main_light,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                bottomLeft: Radius.circular(5.r),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: '견종',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                height: (20 / 12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomText(
                                  text:
                                      RegisterProfileController.to.breed.value,
                                  color: Color(0xff6B6B6B),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main_light,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                bottomLeft: Radius.circular(5.r),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: '나이',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                height: (20 / 12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomText(
                                  text:
                                      '만 ${RegisterProfileController.to.age.value}세',
                                  color: Color(0xff6B6B6B),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main_light,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                bottomLeft: Radius.circular(5.r),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: '성별',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                height: (20 / 12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomText(
                                  text:
                                      RegisterProfileController.to.gender.value,
                                  color: Color(0xff6B6B6B),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main_light,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.r),
                                bottomLeft: Radius.circular(5.r),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: '생일',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                height: (20 / 12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomText(
                                  text:
                                      RegisterProfileController.to.birth.value,
                                  color: Color(0xff6B6B6B),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _profileImageWidget(BuildContext context) {
    return RegisterProfileController.to.profileImage.value == null
        ? Column(
            children: [
              GestureDetector(
                onTap: () {
                  RegisterProfileController.to.pickImage(context);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 134.w,
                      height: 134.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(67.r),
                        image: DecorationImage(
                          image: AssetImage('assets/default_profile_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 134.w,
                      height: 134.w,
                      decoration: BoxDecoration(
                        color: Color(0xffF6F6F6).withOpacity(0.7),
                        borderRadius: BorderRadius.circular(67.r),
                        border: Border.all(
                          color: StaticColor.line,
                          width: 2.w,
                        ),
                      ),
                      child: Center(
                        child: StaticIcon(
                          IconsPath.plus_bold,
                          color: StaticColor.main,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: '반려견의 사진',
                color: Color(0xff6B6B6B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: (20 / 14),
              ),
            ],
          )
        : GestureDetector(
            onTap: () {
              RegisterProfileController.to.pickImage(context);
            },
            child: Container(
              width: 134.w,
              height: 134.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(67.r),
                image: DecorationImage(
                  image: FileImage(
                    File(RegisterProfileController.to.profileImage.value!.path),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
