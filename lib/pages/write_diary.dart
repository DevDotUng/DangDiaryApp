import 'dart:io';

import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_switch.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/write_diary_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
            padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 24.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: '일기쓰기를 미룰까요?',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: StaticColor.icon,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14).h,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '뒤로 가기를 하시면 현재 작성 중이던 일기는 임시 저장됩니다. 해당 일기는 '),
                      TextSpan(
                        text: '\'일기장>밀린 일기\'',
                        style: TextStyle(
                          color: StaticColor.main,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                      ),
                      TextSpan(text: '탭에서 이어서 작성할 수 있어요.'),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/illusts/overdue_diary_dialog.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(context);
                          if (WriteDiaryController.to.isShowPopup.value) {
                            Box homeBox = await Hive.openBox('userInfo');
                            homeBox.put('isShowPopupOnWriteDiary', true);
                          }
                          Get.back();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r),
                            border: Border.all(
                              color: StaticColor.line,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '다음에 쓸게요',
                              color: StaticColor.link,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '이어서 쓸게요',
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    WriteDiaryController.to.changeIsShowPopup();
                  },
                  child: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WriteDiaryController.to.isShowPopup.value
                            ? Container(
                                width: 13.3.w,
                                height: 13.3.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.65.r),
                                  border: Border.all(
                                    color: StaticColor.line,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 13.3.w,
                                height: 13.3.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.65.r),
                                  border: Border.all(
                                    color: StaticColor.line,
                                  ),
                                ),
                              ),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: '이 팝업을 다시 보지 않을래요.',
                          color: StaticColor.icon,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(WriteDiaryController(
        writeType: Get.arguments['writeType'],
        overdueDiary: Get.arguments['overdueDiary'],
        title: Get.arguments['title']));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () async {
                  if (WriteDiaryController.to.writeType == 'write') {
                    Box homeBox = await Hive.openBox('userInfo');
                    bool? isShowPopupOnWriteDiary =
                        homeBox.get('isShowPopupOnWriteDiary');
                    if (isShowPopupOnWriteDiary == null) {
                      _showLaterWriteDialog(context);
                    } else {
                      WriteDiaryController.to.overdue();
                    }
                  } else {
                    Get.back();
                  }
                },
                child: const CustomBackButton(),
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
                                WriteDiaryController.to.getProgress(),
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
                              text: '챌린지를 한 날짜는 언제인가요?',
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
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                        Obx(() => WriteDiaryController.to.essentialTextList[0]),
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
                                      SizedBox(width: 4.w),
                                      Obx(
                                        () => CustomText(
                                          text: WriteDiaryController
                                              .to.date.value,
                                          color: StaticColor.font_main,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          height: (24 / 16),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Icon(Icons.keyboard_arrow_down,
                                          size: 16.r),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                  width: 160.w,
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
                              color: StaticColor.font_main,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              height: (32 / 18),
                            ),
                            SizedBox(width: 4.w),
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                        Obx(() => WriteDiaryController.to.essentialTextList[1]),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                            mainAxisExtent: (Get.width - 64.w) / 3,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                WriteDiaryController.to.changeWeather(index);
                              },
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    color: WriteDiaryController.to
                                                .selectedWeatherIndex.value ==
                                            index
                                        ? StaticColor.main
                                        : StaticColor.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: WriteDiaryController.to
                                                .selectedWeatherIndex.value ==
                                            index
                                        ? null
                                        : Border.all(color: StaticColor.line2),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StaticIcon(
                                          WriteDiaryController
                                              .to.weatherIcons[index],
                                          size: 24.r,
                                          color: WriteDiaryController
                                                      .to
                                                      .selectedWeatherIndex
                                                      .value ==
                                                  index
                                              ? StaticColor.white
                                              : StaticColor.icon,
                                        ),
                                        WriteDiaryController
                                                    .to
                                                    .selectedWeatherIndex
                                                    .value ==
                                                index
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                      blurRadius: 10.r,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  WriteDiaryController
                                                      .to.weathers[index],
                                                  style: TextStyle(
                                                    color: StaticColor.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: (24 / 14).h,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                WriteDiaryController
                                                    .to.weathers[index],
                                                style: TextStyle(
                                                  color: StaticColor.icon,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: (24 / 14).h,
                                                ),
                                              ),
                                      ],
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
                              text: '강아지의 기분은 어땠나요?',
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
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                        Obx(() => WriteDiaryController.to.essentialTextList[2]),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                            mainAxisExtent: (Get.width - 64.w) / 3,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                WriteDiaryController.to.changeFeelings(index);
                              },
                              child: Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    color: WriteDiaryController.to
                                                .selectedFeelingsIndex.value ==
                                            index
                                        ? StaticColor.main
                                        : StaticColor.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: WriteDiaryController.to
                                                .selectedFeelingsIndex.value ==
                                            index
                                        ? null
                                        : Border.all(color: StaticColor.line2),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StaticIcon(
                                          WriteDiaryController
                                              .to.feelingIcons[index],
                                          size: 24.r,
                                          color: WriteDiaryController
                                                      .to
                                                      .selectedFeelingsIndex
                                                      .value ==
                                                  index
                                              ? StaticColor.white
                                              : StaticColor.icon,
                                        ),
                                        WriteDiaryController
                                                    .to
                                                    .selectedFeelingsIndex
                                                    .value ==
                                                index
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                      blurRadius: 10.r,
                                                    ),
                                                  ],
                                                ),
                                                child: Text(
                                                  WriteDiaryController
                                                      .to.feelings[index],
                                                  style: TextStyle(
                                                    color: StaticColor.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: (24 / 14).h,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                WriteDiaryController
                                                    .to.feelings[index],
                                                style: TextStyle(
                                                  color: StaticColor.icon,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: (24 / 14).h,
                                                ),
                                              ),
                                      ],
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
                          color: StaticColor.font_main,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 18),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: (Get.width - 48.w) * 0.66,
                              child: TextField(
                                controller: WriteDiaryController
                                    .to.titleTextEditingController,
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
                                  hintText:
                                      '${WriteDiaryController.to.title} (최대 16글자)',
                                  hintStyle: TextStyle(
                                    color: StaticColor.link,
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
                                      color: StaticColor.line2,
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: StaticColor.line2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 56.h),
                        WriteDiaryController.to.writeType == 'write'
                            ? Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '인증 사진을 올려주세요 (최대 10장)',
                                        color: StaticColor.font_main,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        height: (32 / 18),
                                      ),
                                      SizedBox(width: 4.w),
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: BoxDecoration(
                                          color: StaticColor.main,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Obx(() => WriteDiaryController
                                      .to.essentialTextList[3]),
                                  Obx(
                                    () => WriteDiaryController.to.images.isEmpty
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.5.w),
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: Radius.circular(10.r),
                                              color: Color(0xffD9D9D9),
                                              child: GestureDetector(
                                                onTap: () {
                                                  WriteDiaryController.to
                                                      .pickImages(context);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 88.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                  child: _emptyImageList(),
                                                ),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: double.infinity,
                                            height: 88.h,
                                            child: _imageList(context),
                                          ),
                                  ),
                                  SizedBox(height: 56.h),
                                ],
                              )
                            : Container(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: '강아지와 보낸 하루에 대해 적어주세요',
                              color: StaticColor.font_main,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              height: (32 / 18),
                            ),
                            SizedBox(width: 4.w),
                            Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ],
                        ),
                        Obx(() => WriteDiaryController.to.essentialTextList[4]),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          width: double.infinity,
                          height: 248.h,
                          decoration: BoxDecoration(
                            color: Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: TextField(
                            controller: WriteDiaryController
                                .to.contentTextEditingController,
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
                          color: StaticColor.font_main,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          height: (32 / 18),
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
                              Text(
                                '#',
                                style: TextStyle(
                                  color: StaticColor.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  height: (20 / 14).h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  controller: WriteDiaryController
                                      .to.tagTextEditingController,
                                  onSubmitted: (String tag) {
                                    WriteDiaryController
                                        .to.tagTextEditingController
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
                                    contentPadding:
                                        EdgeInsets.only(bottom: 12.h),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              GestureDetector(
                                onTap: () {
                                  String tag = WriteDiaryController
                                      .to.tagTextEditingController.text;
                                  WriteDiaryController
                                      .to.tagTextEditingController
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '# ',
                                          style: TextStyle(
                                            color: StaticColor.main,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          WriteDiaryController.to.tags[0],
                                          style: TextStyle(
                                            color: StaticColor.main,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
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
                                        Text(
                                          '# ',
                                          style: TextStyle(
                                            color: StaticColor.font_main,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        CustomText(
                                          text: WriteDiaryController
                                              .to.tags[index],
                                          color: StaticColor.font_main,
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
                              color: StaticColor.font_main,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              height: (32 / 18),
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
                        SizedBox(height: 150.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 46.h),
              width: double.infinity,
              height: 102.h,
              color: StaticColor.white,
              child: GestureDetector(
                onTap: () {
                  if (!WriteDiaryController.to.isLoading.value) {
                    if (WriteDiaryController.to.writeType == 'write') {
                      WriteDiaryController.to.submit();
                    } else {
                      WriteDiaryController.to.editDiary();
                    }
                  }
                },
                child: Obx(
                  () => Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: WriteDiaryController.to.getProgress() == 5
                          ? StaticColor.main
                          : StaticColor.link,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: Obx(
                        () => WriteDiaryController.to.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                '제출할게요',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyImageList() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StaticIcon(
            IconsPath.photo,
            size: 20.r,
            color: StaticColor.icon,
          ),
          SizedBox(width: 4.w),
          Text(
            '사진 추가하기',
            style: TextStyle(
              color: StaticColor.link,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            WriteDiaryController.to.images.length,
            (index) => picture(index),
          ),
          WriteDiaryController.to.images.length == 10
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: DottedBorder(
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
                ),
        ],
      ),
    );
  }

  Widget picture(int index) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
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
                if (WriteDiaryController.to.images.isEmpty) {
                  WriteDiaryController.to.progress[3] = 0;
                } else {
                  WriteDiaryController.to.progress[3] = 1;
                }
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
