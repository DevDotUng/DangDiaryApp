import 'package:dangdiarysample/components/cover_color.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/pageview_indicator.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/controllers/diary_controller.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked_listview/stacked_listview.dart';

class Diary extends StatelessWidget {
  Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _appBarHeight = _appBar(context).preferredSize.height;
    double _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Get.put(DiaryController(
        context: context,
        coverId: Get.arguments['coverId'],
        diaryId: Get.arguments['diaryId']));
    return Obx(
      () => DiaryController.to.diaryWithCoverModel.value == null
          ? HomeSkeleton()
          : _diaryView(context, _appBarHeight, _statusBarHeight),
    );
  }

  Widget _diaryView(
      BuildContext context, double _appBarHeight, double _statusBarHeight) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: _appBar(context),
            body: Container(
              color: Colors.white,
              child: StackedListView(
                controller: DiaryController.to.scrollController,
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16.r),
                itemCount: DiaryController
                        .to.diaryWithCoverModel.value!.diaries.length +
                    2,
                itemExtent: Get.width,
                builder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 22.h, right: 36.w),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 4.w,
                            child: Container(
                              width: Get.width - 80.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffEAEAEA),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 20.w,
                            child: Container(
                              width: Get.width - 80.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 36.w,
                            child: Obx(
                              () => Container(
                                width: Get.width - 80.w,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: CoverColor().coverColorList[
                                      DiaryController.to.coverIndex.value],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                // child: Stack(
                                //   children: [
                                //     ...List.generate(
                                //       DiaryController
                                //           .to.randomPositionStickerList.length,
                                //       (index) => DiaryController
                                //           .to.randomPositionStickerList[index],
                                //     ),
                                //   ],
                                // ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 96.h,
                            left: 24.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width - 128.w,
                                  child: Obx(
                                    () => CustomText(
                                      text: DiaryController
                                                  .to
                                                  .diaryWithCoverModel
                                                  .value
                                                  ?.coverTitle ==
                                              null
                                          ? '제목'
                                          : DiaryController
                                              .to
                                              .diaryWithCoverModel
                                              .value!
                                              .coverTitle,
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      height: (22 / 20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                CustomText(
                                  text: DiaryController.to.getNumberOfDiaries(
                                      DiaryController.to.diaryWithCoverModel
                                          .value!.diaries.length),
                                  color: StaticColor.font_main,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 14),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: '받은 좋아요 수',
                                      color: StaticColor.font_main,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 8.w),
                                    StaticIcon(
                                      IconsPath.like,
                                      size: 16.r,
                                      color: StaticColor.font_main,
                                    ),
                                    SizedBox(width: 8.w),
                                    CustomText(
                                      text: DiaryController
                                          .to
                                          .diaryWithCoverModel
                                          .value!
                                          .numberOfLike
                                          .toString(),
                                      color: StaticColor.font_main,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: Get.height * 0.41 - 28.h,
                            right: 0,
                            child: Obx(
                              () => Container(
                                width: 16.w,
                                height: 56.h,
                                decoration: BoxDecoration(
                                  color: CoverColor().holderColorList[
                                      DiaryController.to.holderIndex.value],
                                  borderRadius: BorderRadius.circular(28.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (index == 1) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 22.h, right: 36.w),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: StaticColor.background,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 81.h,
                              horizontal: 8.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _clipHole(),
                                _clipHole(),
                                _clipHole(),
                                _clipHole(),
                                _clipHole(),
                                _clipHole(),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(height: 24.h),
                                Container(
                                  width: double.infinity,
                                  margin:
                                      EdgeInsets.only(left: 13.w, right: 23.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (var i = 0;
                                          i < DiaryController.to.week.length;
                                          i++)
                                        CustomText(
                                          text: DiaryController.to.week[i],
                                          color: i == 0
                                              ? StaticColor.main
                                              : i ==
                                                      DiaryController
                                                              .to.week.length -
                                                          1
                                                  ? StaticColor.main
                                                  : StaticColor.icon,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: (28 / 14),
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Expanded(
                                  child: GridView.builder(
                                    padding: EdgeInsets.only(right: 8.w),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 7,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0,
                                      mainAxisExtent: (Get.height -
                                              _appBarHeight -
                                              _statusBarHeight -
                                              111) /
                                          6,
                                    ),
                                    itemCount: DiaryController.to.days.length,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          Positioned(
                                            top: 33.h,
                                            left: 5.w,
                                            child: DiaryController
                                                        .to.days[index] ==
                                                    null
                                                ? Container()
                                                : DiaryController
                                                            .to
                                                            .days[index]
                                                                ["sticker"]
                                                            .length !=
                                                        0
                                                    ? Column(
                                                        children: [
                                                          Container(
                                                            width: 32.r,
                                                            height: 32.r,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: StaticColor
                                                                  .white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.r),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  offset:
                                                                      Offset(0,
                                                                          4.h),
                                                                  blurRadius:
                                                                      4.r,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.25),
                                                                ),
                                                              ],
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(PublicRepository().getStickerImageUrl(DiaryController
                                                                            .to
                                                                            .days[index]
                                                                        [
                                                                        "sticker"][0]
                                                                    [
                                                                    'stickerImage'])),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 4.h),
                                                          DiaryController
                                                                      .to
                                                                      .days[
                                                                          index]
                                                                          [
                                                                          "sticker"]
                                                                      .length !=
                                                                  1
                                                              ? CustomText(
                                                                  text:
                                                                      '+${DiaryController.to.days[index]["sticker"].length}',
                                                                  color:
                                                                      StaticColor
                                                                          .icon,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                )
                                                              : Container(),
                                                        ],
                                                      )
                                                    : Container(),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 1.h,
                                                color: StaticColor.line,
                                              ),
                                              SizedBox(height: 8.h),
                                              CustomText(
                                                text: DiaryController
                                                            .to.days[index] ==
                                                        null
                                                    ? ""
                                                    : DiaryController
                                                        .to.days[index]["day"]
                                                        .toString(),
                                                color: DiaryController
                                                            .to.days[index] ==
                                                        null
                                                    ? Colors.black
                                                    : index % 7 == 0 ||
                                                            index % 7 == 6
                                                        ? StaticColor.main
                                                        : StaticColor.font_main,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 22.h, right: 36.w),
                      child: Stack(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(12.w, 24.h, 24.w, 32.h),
                            decoration: BoxDecoration(
                              color: StaticColor.background,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 81.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(child: Container()),
                                          CustomText(
                                            text: DiaryController
                                                .to
                                                .diaryWithCoverModel
                                                .value!
                                                .diaries[index - 2]
                                                .title,
                                            color: Color(0xff222222),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (24 / 16),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                StaticIcon(
                                                  DiaryController
                                                          .to
                                                          .diaryWithCoverModel
                                                          .value!
                                                          .diaries[index - 2]
                                                          .isPublic
                                                      ? IconsPath.unlock
                                                      : IconsPath.lock,
                                                  size: 16.r,
                                                  color: StaticColor.icon,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),
                                      Container(
                                        width: double.infinity,
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xffD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(1.r),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: DiaryController.to
                                                .getFormattedDate(
                                                    DiaryController
                                                        .to
                                                        .diaryWithCoverModel
                                                        .value!
                                                        .diaries[index - 2]
                                                        .endDate),
                                            color: Color(0xff6B6B6B),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          Expanded(child: Container()),
                                          CustomText(
                                            text: '날씨',
                                            color: Color(0xffA6A6A6),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          SizedBox(width: 4.w),
                                          StaticIcon(
                                            DiaryController.to.getWeather(
                                                DiaryController
                                                    .to
                                                    .diaryWithCoverModel
                                                    .value!
                                                    .diaries[index - 2]
                                                    .weather),
                                            size: 16.r,
                                            color: StaticColor.icon,
                                          ),
                                          SizedBox(width: 8.w),
                                          CustomText(
                                            text: '기분',
                                            color: Color(0xffA6A6A6),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          SizedBox(width: 4.w),
                                          StaticIcon(
                                            DiaryController.to.getFeeling(
                                                DiaryController
                                                    .to
                                                    .diaryWithCoverModel
                                                    .value!
                                                    .diaries[index - 2]
                                                    .feeling),
                                            size: 16.r,
                                            color: StaticColor.icon,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      SizedBox(
                                        height: 215.h,
                                        child: Stack(
                                          children: [
                                            PageView.builder(
                                              key: PageStorageKey('${index}'),
                                              controller: DiaryController.to
                                                      .pageViewControllerList[
                                                  index - 2],
                                              itemCount: DiaryController
                                                  .to
                                                  .diaryWithCoverModel
                                                  .value!
                                                  .diaries[index - 2]
                                                  .images
                                                  .length,
                                              itemBuilder: (context, jndex) {
                                                return Container(
                                                  width: double.infinity,
                                                  height: 215.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          PublicRepository()
                                                              .getDiaryImageUrl(
                                                                  DiaryController
                                                                      .to
                                                                      .diaryWithCoverModel
                                                                      .value!
                                                                      .diaries[
                                                                          index -
                                                                              2]
                                                                      .images[jndex])),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Positioned(
                                              bottom: 16.h,
                                              left: (Get.width - 120.w) / 2 -
                                                  28.w,
                                              child: PageViewIndicator(
                                                itemCount: DiaryController
                                                    .to
                                                    .diaryWithCoverModel
                                                    .value!
                                                    .diaries[index - 2]
                                                    .images
                                                    .length,
                                                pageController: DiaryController
                                                        .to
                                                        .pageViewControllerList[
                                                    index - 2],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              DiaryController.to
                                                  .likeDiary(index - 2);
                                            },
                                            child: Obx(
                                              () => StaticIcon(
                                                IconsPath.like,
                                                size: 24.r,
                                                color: DiaryController
                                                        .to
                                                        .diaryWithCoverModel
                                                        .value!
                                                        .diaries[index - 2]
                                                        .isLike
                                                    ? StaticColor.like
                                                    : Color(0xffD8D8D8),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          CustomText(
                                            text: DiaryController
                                                .to
                                                .diaryWithCoverModel
                                                .value!
                                                .diaries[index - 2]
                                                .numberOfLike
                                                .toString(),
                                            color: StaticColor.icon,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (14 / 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                  text: DiaryController
                                                      .to
                                                      .diaryWithCoverModel
                                                      .value!
                                                      .diaries[index - 2]
                                                      .content,
                                                  color: Color(0xff6B6B6B),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: (20 / 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      Container(
                                        height: 32.h,
                                        child: ListView.builder(
                                          key: PageStorageKey('${index}'),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: DiaryController
                                              .to
                                              .diaryWithCoverModel
                                              .value!
                                              .diaries[index - 2]
                                              .tags
                                              .length,
                                          itemBuilder: (context, jndex) {
                                            if (jndex == 0) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 4.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6.h,
                                                    horizontal: 16.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  border: Border.all(
                                                    color: StaticColor.line2,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                      text: '# ',
                                                      color: StaticColor.main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    CustomText(
                                                      text: DiaryController
                                                          .to
                                                          .diaryWithCoverModel
                                                          .value!
                                                          .diaries[index - 2]
                                                          .tags[jndex],
                                                      color: StaticColor.main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 4.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6.h,
                                                    horizontal: 16.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  border: Border.all(
                                                    color: StaticColor.line2,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                      text: '# ',
                                                      color:
                                                          StaticColor.font_main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    CustomText(
                                                      text: DiaryController
                                                          .to
                                                          .diaryWithCoverModel
                                                          .value!
                                                          .diaries[index - 2]
                                                          .tags[jndex],
                                                      color:
                                                          StaticColor.font_main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 28.w,
                            child: Container(
                              width: 40.w,
                              height: 66.h,
                              decoration: BoxDecoration(
                                color: StaticColor.main_light,
                                borderRadius: DiaryController
                                            .to
                                            .diaryWithCoverModel
                                            .value!
                                            .diaries[index - 2]
                                            .stickerShape ==
                                        'circle'
                                    ? BorderRadius.only(
                                        bottomLeft: Radius.circular(20.r),
                                        bottomRight: Radius.circular(20.r),
                                      )
                                    : BorderRadius.only(
                                        bottomLeft: Radius.circular(5.r),
                                        bottomRight: Radius.circular(5.r),
                                      ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(child: Container()),
                                  DiaryController
                                              .to
                                              .diaryWithCoverModel
                                              .value!
                                              .diaries[index - 2]
                                              .stickerShape ==
                                          'circle'
                                      ? Container(
                                          width: 32.w,
                                          height: 32.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(62.r),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  PublicRepository()
                                                      .getStickerImageUrl(
                                                          DiaryController
                                                              .to
                                                              .diaryWithCoverModel
                                                              .value!
                                                              .diaries[
                                                                  index - 2]
                                                              .stickerImage)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 32.w,
                                          height: 26.h,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  PublicRepository()
                                                      .getStickerImageUrl(
                                                          DiaryController
                                                              .to
                                                              .diaryWithCoverModel
                                                              .value!
                                                              .diaries[
                                                                  index - 2]
                                                              .stickerImage)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
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
          Obx(
            () => IgnorePointer(
              ignoring: !DiaryController.to.isShowEditDiaryColorModal.value,
              child: AnimatedOpacity(
                opacity:
                    DiaryController.to.isShowEditDiaryColorModal.value ? 1 : 0,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                  onTap: () {
                    DiaryController.to.changeIsShowEditDiaryColorModal(false);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.45),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height - 727.h,
            left: Get.width / 2 - 100.w,
            child: Obx(
              () => IgnorePointer(
                ignoring: !DiaryController.to.isShowEditDiaryColorModal.value,
                child: AnimatedOpacity(
                  opacity: DiaryController.to.isShowEditDiaryColorModal.value
                      ? 1
                      : 0,
                  duration: Duration(milliseconds: 200),
                  child: SizedBox(
                    width: 200.w,
                    height: 245.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 20.w,
                          child: Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: Color(0xffEAEAEA),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 10.w,
                          child: Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: CoverColor().coverColorList[
                                  DiaryController.to.coverTempIndex.value],
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 107.5.h,
                          right: 0.w,
                          child: Obx(
                            () => Container(
                              width: 70.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: CoverColor().holderColorList[
                                    DiaryController.to.holderTempIndex.value],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              bottom: DiaryController.to.isShowEditDiaryColorModal.value
                  ? 0
                  : -410.h,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                height: 410.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      width: 48.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomText(
                      text: '표지 색상을 선택해주세요',
                      color: Color(0xff4D4D4D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      height: (32 / 18),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 38.w,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: CoverColor().coverColorList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => DiaryController.to.coverTempIndex.value ==
                                    index
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    width: 38.w,
                                    height: 38.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19.r),
                                      border: Border.all(
                                        color:
                                            CoverColor().coverColorList[index],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 32.w,
                                        height: 32.w,
                                        decoration: BoxDecoration(
                                          color: CoverColor()
                                              .coverColorList[index],
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      DiaryController.to
                                          .changeCoverIndex(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 3.h, horizontal: 8.w),
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        color:
                                            CoverColor().coverColorList[index],
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: Color(0xffF5F5F5),
                    ),
                    SizedBox(height: 24.h),
                    CustomText(
                      text: '홀더 색상을 선택해주세요',
                      color: Color(0xff4D4D4D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      height: (32 / 18),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 38.w,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: CoverColor().holderColorList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => DiaryController.to.holderTempIndex.value ==
                                    index
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    width: 38.w,
                                    height: 38.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19.r),
                                      border: Border.all(
                                        color:
                                            CoverColor().holderColorList[index],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 32.w,
                                        height: 32.w,
                                        decoration: BoxDecoration(
                                          color: CoverColor()
                                              .holderColorList[index],
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      DiaryController.to
                                          .changeHolderIndex(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 3.h, horizontal: 8.w),
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        color:
                                            CoverColor().holderColorList[index],
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: Color(0xffF5F5F5),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        SizedBox(width: 24.w),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              DiaryController.to.changeCoverIndex(10);
                              DiaryController.to.changeHolderIndex(10);
                            },
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0.r),
                                border: Border.all(
                                  color: Color(0xffA6A6A6),
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: '색상 초기화',
                                  color: Color(0xffA6A6A6),
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
                              DiaryController.to
                                  .changeIsShowEditDiaryColorModal(false);
                              DiaryController.to.applyColors();
                              DiaryController.to.showToast(
                                  IconsPath.check, '다이어리 색상 편집이 완료되었어요!');
                              DiariesController.to.myDiaryInit();
                            },
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: StaticColor.main,
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
                          ),
                        ),
                        SizedBox(width: 24.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
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
      title: Obx(
        () => CustomText(
          text: DiaryController.to.pageIndex.value == 0 ||
                  DiaryController.to.pageIndex.value == 1
              ? DiaryController.to.diaryWithCoverModel.value!.date
              : '${DiaryController.to.pageIndex - 1}/${DiaryController.to.diaryWithCoverModel.value!.diaries.length}',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: GestureDetector(
            onTap: () {
              int _page =
                  DiaryController.to.scrollController.offset ~/ Get.width;
              if (_page == 0 || _page == 1) {
                DiaryController.to.editDiaryCover(context);
              } else {
                DiaryController.to.editDiary(context);
              }
            },
            child: StaticIcon(
              IconsPath.more_bold,
              size: 24.r,
              color: Color(0xff272727),
            ),
          ),
        ),
      ],
    );
  }

  Widget _clipHole() {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 1.2.r,
            spreadRadius: -1.2.r,
          ),
        ],
      ),
    );
  }
}
