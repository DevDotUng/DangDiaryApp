import 'dart:io';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/write_diary_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({Key? key}) : super(key: key);

  void _showLaterWriteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.all(24.0.r),
            width: double.infinity,
            height: 372.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                    CustomText(
                      text: '챌린지 목록으로 이동하고 싶어요',
                      color: Color(0xff6B6B6B),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      height: (20 / 12).h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(WriteDiaryController());
    return _writeDiaryWidget(context);
  }

  Widget _writeDiaryWidget(BuildContext context) {
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
            child: Icon(
              Icons.arrow_back,
              size: 32.r,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: CustomText(
            text: '일기쓰기',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: (32 / 16).h,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0.w),
              child: Container(
                width: 71.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: Color(0xffA6A6A6),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Center(
                  child: CustomText(
                    text: '일기제출',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 24.0.w),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15.0.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16.w),
                      Icon(Icons.golf_course),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: '챌린지명',
                        color: Color(0xff545454),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 14).h,
                      ),
                      SizedBox(width: 29.w),
                      CustomText(
                        text: '한강공원 술래잡기',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (24 / 14).h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15.0.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month, size: 16.r),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: '도전 날짜',
                            color: Color(0xff545454),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 24.w),
                          GestureDetector(
                            onTap: () {
                              WriteDiaryController.to.changeDate(context);
                            },
                            child: Obx(
                              () => CustomText(
                                text: WriteDiaryController.to.date.value,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (24 / 14).h,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.fmd_good_outlined, size: 16.r),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: '장소',
                            color: Color(0xff545454),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: (24 / 14).h,
                          ),
                          SizedBox(width: 52.w),
                          CustomText(
                            text: '캘리포니아 협재비치',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.sunny, size: 16.r),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: '날씨',
                            color: Color(0xff545454),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: (24 / 14).h,
                          ),
                          SizedBox(width: 52.w),
                          CustomText(
                            text: '맑음',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.control_point, size: 16.r),
                          SizedBox(width: 4.w),
                          CustomText(
                            text: '아이 기분',
                            color: Color(0xff545454),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: (24 / 14).h,
                          ),
                          SizedBox(width: 24.w),
                          CustomText(
                            text: '아주 좋았어요',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 14).h,
                    ),
                    decoration: InputDecoration(
                      hintText: '일기 제목을 작성해주세요',
                      hintStyle: TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (24 / 14).h,
                      ),
                      contentPadding: EdgeInsets.only(top: 3.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Icon(
                          Icons.book,
                          size: 16.r,
                          color: Colors.black,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 8.w,
                        maxHeight: 7.h,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15.0.r),
                  color: Color(0xffD9D9D9),
                  child: GestureDetector(
                    onTap: () {
                      WriteDiaryController.to.pickImages();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 104.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0.r),
                      ),
                      child: Obx(
                        () => WriteDiaryController.to.images.isEmpty
                            ? _emptyImageList()
                            : _imageList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: double.infinity,
                  child: TextField(
                    maxLines: 15,
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
                      contentPadding: EdgeInsets.only(top: 20.0.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                          bottom: ((19.2 - 1) * 19).h,
                        ),
                        child: Icon(
                          Icons.book,
                          size: 16.r,
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 10.w),
          Text(
            '인증 사진을 올려주세요 (최대 3장)',
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: WriteDiaryController.to.images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Container(
            width: 104.w,
            height: 104.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: FileImage(
                  File(WriteDiaryController.to.images[index].path),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
