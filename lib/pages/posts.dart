import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/expandable_text.dart';
import 'package:dangdiarysample/components/pageview_indicator.dart';
import 'package:dangdiarysample/controllers/posts_controller.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final controller = Get.put<PostsController>(
      PostsController(
        browseId: Get.arguments['browseId'],
        query: Get.arguments['query'],
        searchType: Get.arguments['searchType'],
        dogName: Get.arguments['dogName'],
        nickname: Get.arguments['nickname'],
      ),
      tag: Get.arguments['query']);

  @override
  Widget build(BuildContext context) {
    Get.find<PostsController>();
    return Obx(
      () => controller.postsModels.isEmpty ? HomeSkeleton() : _postsWidget(),
    );
  }

  Widget _postsWidget() {
    return Scaffold(
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
          text: Get.arguments['query'] == null
              ? '둘러보기'
              : Get.arguments['searchType'] == 'hashTag'
                  ? '#${Get.arguments['query']}'
                  : Get.arguments['query'],
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.challengeId.value == null
                ? Container()
                : GestureDetector(
                    onTap: () {
                      Get.toNamed('/challengeDetail', arguments: {
                        'challengeId': controller.challengeId.value
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      width: 166,
                      height: 33,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: Text(
                          '이 챌린지 하러 가기',
                          style: TextStyle(
                            color: StaticColor.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: controller.postsModels?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32.w,
                                    height: 32.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        image: controller.postsModels![index]
                                                    ?.profileImage ==
                                                null
                                            ? AssetImage(
                                                    'assets/default_profile_image.png')
                                                as ImageProvider
                                            : NetworkImage(PublicRepository()
                                                .getProfileImageUrl(controller
                                                    .postsModels![index]!
                                                    .profileImage)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomText(
                                    text:
                                        controller.postsModels![index].dogName,
                                    color: Color(0xff222222),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: (20 / 14),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                              child: GestureDetector(
                                onTap: () {
                                  controller.editDiary(context);
                                },
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                  size: 24.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Container(
                          margin: EdgeInsets.only(bottom: 24.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4.r,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('assets/diary_background.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(16.w, 24.h, 24.w, 16.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 375.h,
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
                                          CustomText(
                                            text: controller
                                                .postsModels![index].title,
                                            color: Color(0xff222222),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (24 / 16),
                                          ),
                                          SizedBox(height: 4.h),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 41.w),
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
                                                text: getFormattedDate(
                                                    controller
                                                        .postsModels![index]
                                                        .registerDate),
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
                                                getWeather(controller
                                                    .postsModels![index]
                                                    .weather),
                                                size: 16.r,
                                                color: Color(0xff6B6B6B),
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
                                                getFeeling(controller
                                                    .postsModels![index]
                                                    .feeling),
                                                size: 16.r,
                                                color: StaticColor.icon,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          SizedBox(
                                            height: 259.h,
                                            child: Stack(
                                              children: [
                                                PageView.builder(
                                                  key: PageStorageKey(
                                                      '${index}'),
                                                  controller: controller
                                                          .pageViewControllerList[
                                                      index],
                                                  itemCount: controller
                                                      .postsModels![index]
                                                      .images
                                                      .length,
                                                  itemBuilder:
                                                      (context, jndex) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 259.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              PublicRepository()
                                                                  .getDiaryImageUrl(controller
                                                                      .postsModels![
                                                                          index]!
                                                                      .images[jndex])),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Positioned(
                                                  bottom: 16.h,
                                                  left: (Get.width - 76.w) / 2 -
                                                      28.w,
                                                  child: PageViewIndicator(
                                                    itemCount: controller
                                                        .postsModels![index]
                                                        .images
                                                        .length,
                                                    pageController: controller
                                                            .pageViewControllerList[
                                                        index],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              StaticIcon(
                                                controller.postsModels![index]
                                                        .isLike
                                                    ? IconsPath.like
                                                    : IconsPath.like_outlined,
                                                size: 24.r,
                                                color: controller
                                                        .postsModels![index]
                                                        .isLike
                                                    ? StaticColor.like
                                                    : Color(0xff202020),
                                              ),
                                              SizedBox(width: 4.w),
                                              CustomText(
                                                text:
                                                    '${controller.postsModels![index].numberOfLike} 개',
                                                color: StaticColor.font_main,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                height: (14 / 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: ExpandableText(
                                                  controller.postsModels![index]
                                                      .content,
                                                  expandText: '더보기',
                                                  maxLines: 2,
                                                  linkColor: Color(0xffA6A6A6),
                                                  animation: true,
                                                  animationDuration: Duration(
                                                      milliseconds: 500),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color(0xff6B6B6B),
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: (20 / 14),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 24.h),
                                          SizedBox(
                                            height: 32.h,
                                            child: ListView.builder(
                                              key: PageStorageKey('${index}'),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller
                                                  .postsModels![index]
                                                  .tags
                                                  .length,
                                              itemBuilder: (context, jndex) {
                                                if (jndex == 0) {
                                                  return GestureDetector(
                                                    onTap: () => controller
                                                        .searchByHashTag(
                                                            controller
                                                                .postsModels![
                                                                    index]
                                                                .tags[jndex]),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 4.w),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 6.h,
                                                              horizontal: 16.w),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xffD9D9D9),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          CustomText(
                                                            text: '# ',
                                                            color: StaticColor
                                                                .main,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          CustomText(
                                                            text: controller
                                                                .postsModels![
                                                                    index]
                                                                .tags[jndex],
                                                            color: StaticColor
                                                                .main,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return GestureDetector(
                                                    onTap: () => controller
                                                        .searchByHashTag(
                                                            controller
                                                                .postsModels![
                                                                    index]
                                                                .tags[jndex]),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 4.w),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 6.h,
                                                              horizontal: 16.w),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xffD9D9D9),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          CustomText(
                                                            text: '# ',
                                                            color: StaticColor
                                                                .font_main,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          CustomText(
                                                            text: controller
                                                                .postsModels![
                                                                    index]
                                                                .tags[jndex],
                                                            color: StaticColor
                                                                .font_main,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ],
                                                      ),
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
                                left: 32.w,
                                child: Container(
                                  width: 40.w,
                                  height: 66.h,
                                  decoration: BoxDecoration(
                                    color: StaticColor.main_light,
                                    borderRadius: controller.postsModels[index]
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
                                      controller.postsModels[index]
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
                                                              controller
                                                                  .postsModels[
                                                                      index]
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
                                                              controller
                                                                  .postsModels[
                                                                      index]
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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

  String getFormattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy년 MM월 dd일 ').format(dateTime);
    String dayOfWeek = DateFormat.E('ko_KR').format(dateTime);
    String result = formattedDate + dayOfWeek + '요일';

    return result;
  }

  String getFeeling(type) {
    String feeling;
    final map = {
      '기뻐요': IconsPath.happy,
      '즐거워요': IconsPath.fun,
      '차분해요': IconsPath.happy,
      '활기차요': IconsPath.full_energy,
      '화나요': IconsPath.angry,
      '짜증나요': IconsPath.annoying,
      '두려워요': IconsPath.afraid,
      '불안해요': IconsPath.nervous,
      '모르겠어요': IconsPath.dont_know,
    };
    feeling = map[type] ?? IconsPath.happy;

    return feeling;
  }

  String getWeather(type) {
    String weather;
    final map = {
      '맑음': IconsPath.sunny_bold,
      '흐림': IconsPath.cloudy_bold,
      '비': IconsPath.rain_bold,
      '눈': IconsPath.snow_bold,
      '천둥번개': IconsPath.thunder_bold,
      '안개': IconsPath.fog_bold,
    };
    weather = map[type] ?? IconsPath.sunny_bold;

    return weather;
  }
}
