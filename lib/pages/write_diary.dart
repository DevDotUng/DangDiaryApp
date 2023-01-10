import 'dart:io';

import 'package:dangdiarysample/components/custom_switch.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/write_diary_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({Key? key}) : super(key: key);

  void _showLaterWriteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.all(24.0.r),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.message, size: 24.r),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '일기를 다음에 쓰시겠어요?',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14).h,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '괜찮아요. 이번에 쓰지 않더라도, '),
                      TextSpan(
                        text: '일기장 탭> 밀린 일기 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                      ),
                      TextSpan(
                          text: '에서 언제든지 다시 도전할 수 있어요.\n지'
                              '이번에는 아쉽게 칭찬도장을 모으지 못했지만'
                              ', 다음에 밀린 일기를 쓰시면 받으실 수 있어요!'),
                    ],
                  ),
                ),
                SizedBox(height: 127.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Get.back();
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xff7D7D7D),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '알겠어요',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(buildContext);
                        Get.offAndToNamed('/allChallenge');
                      },
                      child: CustomText(
                        text: '챌린지 목록으로 이동하고 싶어요',
                        color: Color(0xff6B6B6B),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: (20 / 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(WriteDiaryController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              _showLaterWriteDialog(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Icon(
                Icons.arrow_back,
                size: 32.r,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          title: CustomText(
            text: '일기쓰기',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            height: (32 / 20),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: Row(
                  children: [
                    Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: (Get.width - 48) /
                            5 *
                            WriteDiaryController.to.getProgress(),
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: Color(0xff7B61FF),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: ListView(
                  controller: WriteDiaryController.to.scrollController,
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '몇 월 며칠의 일기인가요?',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7B61FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                WriteDiaryController.to.changeDate(context);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 16.r),
                                  SizedBox(width: 4.w),
                                  Obx(
                                    () => CustomText(
                                      text: WriteDiaryController.to.date.value,
                                      color: Color(0xff545454),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      height: (24 / 16),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(Icons.keyboard_arrow_down, size: 16.r),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              width: 170.w,
                              height: 1.h,
                              color: Color(0xffD9D9D9),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '그 날의 날씨는 어땠나요?',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7B61FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.h,
                        mainAxisExtent: (Get.width - 64.w) / 3,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            WriteDiaryController.to.changeWeather(index);
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color: WriteDiaryController
                                            .to.selectedWeatherIndex ==
                                        index
                                    ? Color(0xffA6A6A6)
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: WriteDiaryController
                                            .to.selectedWeatherIndex ==
                                        index
                                    ? Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              blurRadius: 10.r,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          WriteDiaryController
                                              .to.weathers[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (24 / 14).h,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        WriteDiaryController.to.weathers[index],
                                        style: TextStyle(
                                          color: Color(0xff545454),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: (24 / 14).h,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '초코의 기분은 어땠나요?',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7B61FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 8.h,
                        mainAxisExtent: (Get.width - 64.w) / 3,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            WriteDiaryController.to.changeFeelings(index);
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color: WriteDiaryController
                                            .to.selectedFeelingsIndex ==
                                        index
                                    ? Color(0xffA6A6A6)
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: WriteDiaryController
                                            .to.selectedFeelingsIndex ==
                                        index
                                    ? Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              blurRadius: 10.r,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          WriteDiaryController
                                              .to.feelings[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (24 / 14).h,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        WriteDiaryController.to.feelings[index],
                                        style: TextStyle(
                                          color: Color(0xff545454),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: (24 / 14).h,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 56.h),
                    CustomText(
                      text: '일기 제목을 입력해 주세요',
                      color: Color(0xff545454),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      height: (32 / 20),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: (Get.width - 48.w) * 0.66,
                          child: TextField(
                            maxLength: 16,
                            cursorColor: Colors.black,
                            cursorHeight: 24.h,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: (24 / 14).h,
                            ),
                            decoration: InputDecoration(
                              hintText: '한강공원 술래잡기 (최대 16글자)',
                              hintStyle: TextStyle(
                                color: Color(0xffA6A6A6),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (24 / 14).h,
                              ),
                              counter: Container(),
                              contentPadding: EdgeInsets.only(top: 8.h),
                              prefixIconConstraints: BoxConstraints(
                                minWidth: 8.w,
                                maxHeight: 7.h,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '인증 사진을 올려주세요 (최대 3장)',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7B61FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => WriteDiaryController.to.images.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.5.w),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10.r),
                                color: Color(0xffD9D9D9),
                                child: GestureDetector(
                                  onTap: () {
                                    WriteDiaryController.to.pickImages(context);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 88.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: _emptyImageList(),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              height: 88.h,
                              child: _imageList(),
                            ),
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '초코와 보낸 하루에 대해 적어주세요',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7B61FF),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      height: 248.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        onChanged: (String content) {
                          WriteDiaryController.to
                              .changeContentListener(content);
                        },
                        maxLines: 15,
                        cursorColor: Colors.black,
                        cursorWidth: 1.w,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (24 / 14).h,
                        ),
                        decoration: InputDecoration(
                          hintText: '일기 내용을 작성해주세요',
                          hintStyle: TextStyle(
                            color: Color(0xffA6A6A6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 56.h),
                    CustomText(
                      text: '태그를 추가해 주세요',
                      color: Color(0xff545454),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      height: (32 / 20),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      width: double.infinity,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.tag,
                            size: 16.r,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: TextField(
                              controller: WriteDiaryController
                                  .to.tagTextEditingController,
                              onSubmitted: (String tag) {
                                WriteDiaryController.to.tagTextEditingController
                                    .clear();
                                WriteDiaryController.to.addTag(tag);
                              },
                              cursorColor: Colors.black,
                              cursorWidth: 1.w,
                              cursorHeight: 24.h,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (20 / 14).h,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 12.h),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () {
                              String tag = WriteDiaryController
                                  .to.tagTextEditingController.text;
                              WriteDiaryController.to.tagTextEditingController
                                  .clear();
                              WriteDiaryController.to.addTag(tag);
                            },
                            child: Icon(
                              Icons.add,
                              size: 16.r,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 40.h,
                      child: Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: WriteDiaryController.to.tags.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Container(
                                margin: EdgeInsets.only(right: 8.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.r),
                                  border: Border.all(
                                    color: Color(0xffD9D9D9),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.tag,
                                      size: 16.r,
                                      color: Color(0xff7B61FF),
                                    ),
                                    CustomText(
                                      text: WriteDiaryController.to.tags[0],
                                      color: Color(0xff7B61FF),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: (20 / 14),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                margin: EdgeInsets.only(right: 8.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.r),
                                  border: Border.all(
                                    color: Color(0xffD9D9D9),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.tag,
                                      size: 16.r,
                                      color: Color(0xff222222),
                                    ),
                                    CustomText(
                                      text: WriteDiaryController.to.tags[index],
                                      color: Color(0xff222222),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: (20 / 14),
                                    ),
                                    SizedBox(width: 8.w),
                                    GestureDetector(
                                      onTap: () {
                                        WriteDiaryController.to
                                            .removeTag(index);
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 16.r,
                                        color: Color(0xff6B6B6B),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 56.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: '일기 공개여부',
                          color: Color(0xff545454),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            WriteDiaryController.to.changePublic();
                          },
                          child: Obx(
                            () => CustomSwitch(
                              value: WriteDiaryController.to.isPublic.value,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 56.h),
                    GestureDetector(
                      onTap: () {
                        WriteDiaryController.to.scrollController.animateTo(
                          149.h, // 149.h, 469.h, 1034.h, 1226.h
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: Color(0xff7D7D7D),
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: '제출할게요',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyImageList() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 16,
            color: Color(0xff6B6B6B),
          ),
          SizedBox(width: 4.w),
          Text(
            '사진 추가하기',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageList() {
    return Builder(
      builder: (context) {
        if (WriteDiaryController.to.images.length == 1) {
          return Row(
            children: [
              picture(context, 0),
              SizedBox(width: 8.w),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                color: Color(0xffD9D9D9),
                child: GestureDetector(
                  onTap: () {
                    WriteDiaryController.to.pickImages(context);
                  },
                  child: Container(
                    width: (Get.width - 64.w) / 3,
                    height: 88.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.add, size: 12.r),
                  ),
                ),
              ),
            ],
          );
        } else if (WriteDiaryController.to.images.length == 2) {
          return Row(
            children: [
              picture(context, 0),
              SizedBox(width: 8.w),
              picture(context, 1),
              SizedBox(width: 8.w),
              Expanded(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10.r),
                  color: Color(0xffD9D9D9),
                  child: GestureDetector(
                    onTap: () {
                      WriteDiaryController.to.pickImages(context);
                    },
                    child: Container(
                      height: 88.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(child: Icon(Icons.add, size: 12.r)),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (WriteDiaryController.to.images.length == 3) {
          return Row(
            children: [
              picture(context, 0),
              SizedBox(width: 8.w),
              picture(context, 1),
              SizedBox(width: 8.w),
              picture(context, 2)
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget picture(BuildContext context, int index) {
    return Container(
      width: (Get.width - 64.w) / 3,
      height: 88.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: FileImage(
            File(WriteDiaryController.to.images[index].path),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () {
                WriteDiaryController.to.images.removeAt(index);
              },
              child: Icon(
                Icons.clear,
                size: 16.r,
                color: Color(0xffA6A6A6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
