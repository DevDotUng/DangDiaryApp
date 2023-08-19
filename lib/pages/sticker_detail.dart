import 'dart:ui';

import 'package:dangdiarysample/components/cover_color.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/sticker_detail_controller.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StickerDetail extends StatelessWidget {
  StickerDetail({Key? key}) : super(key: key);

  List colorList = [
    Color(0xffB0DBAB),
    Color(0xffFFE092),
    Color(0xffEFD5FF),
    Color(0xffD3E0FF),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(StickerDetailController(challengeId: Get.arguments['challengeId']));
    return Obx(
      () => StickerDetailController.to.stickerDetailModel?.value == null
          ? HomeSkeleton()
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32.r,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                title: CustomText(
                  text: '칭찬 스티커',
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
                      SizedBox(height: 16.h),
                      Stack(
                        children: [
                          Container(
                            width: 154.w,
                            height: 154.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(77.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  offset: Offset(0, 4.h),
                                  blurRadius: 10.r,
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(PublicRepository()
                                    .getStickerImageUrl(StickerDetailController
                                        .to
                                        .stickerDetailModel
                                        .value!
                                        .stickerImage)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: Text(
                                  'X${StickerDetailController.to.stickerDetailModel.value!.numberOfSticker}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: StickerDetailController
                            .to.stickerDetailModel.value!.challengeTitle,
                        color: StaticColor.font_main,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (28 / 20),
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text:
                            '첫 획득 일자 ${getFormattedDate(StickerDetailController.to.stickerDetailModel.value!.firstGetDate, 'yyyy.mm.dd')}',
                        color: StaticColor.main,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: (24 / 16),
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text:
                            '최근 획득 일자 ${getFormattedDate(StickerDetailController.to.stickerDetailModel.value!.recentGetDate, 'yyyy.mm.dd')}',
                        color: StaticColor.icon,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: double.infinity,
                        height: 8.h,
                        color: Color(0xffF5F5F5),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          SizedBox(width: 24.w),
                          CustomText(
                            text: '해당 챌린지 일기',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: (24 / 16),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 24.h, horizontal: 24.w),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: StickerDetailController.to
                              .stickerDetailModel.value!.diaryBySticker.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed('/diary', arguments: {
                                  'coverId': StickerDetailController
                                      .to
                                      .stickerDetailModel
                                      .value!
                                      .diaryBySticker[index]
                                      .coverId,
                                  'diaryId': StickerDetailController
                                      .to
                                      .stickerDetailModel
                                      .value!
                                      .diaryBySticker[index]
                                      .diaryId,
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                width: double.infinity,
                                height: 56.h,
                                decoration: BoxDecoration(
                                  color: CoverColor().getCoverColor(
                                      StickerDetailController
                                          .to
                                          .stickerDetailModel
                                          .value!
                                          .diaryBySticker[index]
                                          .coverColor),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 16.w),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      height: 24.h,
                                      decoration: BoxDecoration(
                                        color: StaticColor.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          getFormattedDate(
                                              StickerDetailController
                                                  .to
                                                  .stickerDetailModel
                                                  .value!
                                                  .diaryBySticker[index]
                                                  .endDate,
                                              'yy년 MM월 dd일'),
                                          style: TextStyle(
                                            color: StaticColor.font_main,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      StickerDetailController
                                          .to
                                          .stickerDetailModel
                                          .value!
                                          .diaryBySticker[index]
                                          .diaryTitle,
                                      style: TextStyle(
                                        color: Color(0xff222222),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    StaticIcon(
                                      IconsPath.like,
                                      size: 16.r,
                                      color: Color(0xff272727),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      '${StickerDetailController.to.stickerDetailModel.value!.diaryBySticker[index].numberOfLike}',
                                      style: TextStyle(
                                        color: StaticColor.font_main,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  String getFormattedDate(String date, String format) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat(format).format(dateTime);

    return formattedDate;
  }
}
