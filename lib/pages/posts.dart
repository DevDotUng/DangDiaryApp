import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/expandable_text.dart';
import 'package:dangdiarysample/controllers/posts_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostsController());
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
          text: '둘러보기',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        color: Colors.white,
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
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
                                image: AssetImage('assets/dog2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '초코',
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
                          PostsController.to.editDiary(context);
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
                        padding: EdgeInsets.fromLTRB(16.w, 24.h, 24.w, 16.h),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: '눈밭에서 백덤블링하기',
                                    color: Color(0xff222222),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    height: (24 / 16),
                                  ),
                                  SizedBox(height: 4.h),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 41.w),
                                    width: double.infinity,
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(1.r),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '2022년 12월 06일 금요일',
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
                                      Icon(
                                        Icons.wb_sunny_outlined,
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
                                        IconsPath.nervous,
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
                                          key: PageStorageKey('${index}'),
                                          controller: PostsController
                                              .to.pageViewControllerList[index],
                                          itemCount: 3,
                                          itemBuilder: (context, jndex) {
                                            return Container(
                                              width: double.infinity,
                                              height: 259.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/dog4.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          bottom: 16.h,
                                          left: (Get.width - 120.w) / 2 - 28.w,
                                          child: SizedBox(
                                            width: 56,
                                            height: 4,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 3,
                                              itemBuilder: (context, kndex) {
                                                return Obx(
                                                  () => Container(
                                                    margin: EdgeInsets.only(
                                                        right: 4.w),
                                                    width: 16.w,
                                                    height: 4.h,
                                                    decoration: BoxDecoration(
                                                      color: PostsController.to
                                                                      .pageViewIndexList[
                                                                  index] ==
                                                              kndex
                                                          ? StaticColor
                                                              .main_light
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.r),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      StaticIcon(
                                        IconsPath.like_outlined,
                                        size: 24.r,
                                        color: Color(0xff202020),
                                      ),
                                      SizedBox(width: 4.w),
                                      CustomText(
                                        text: '995 개',
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
                                      ExpandableText(
                                        '찌롱이 정기 건강 검진 할 때가 됐긴 했다. 마침 챌린지로 건강 검진이 올라와서 바~로 병원행! 건강한 줄 찌롱이 정기 건강 검진 할 때가 됐긴 했다. 마침 챌린지로 건강 검진이 올라와서 바~로 병원행!',
                                        expandText: '더보기',
                                        maxLines: 2,
                                        linkColor: Color(0xffA6A6A6),
                                        animation: true,
                                        animationDuration:
                                            Duration(milliseconds: 500),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xff6B6B6B),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: (20 / 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24.h),
                                  Container(
                                    height: 32.h,
                                    child: ListView.builder(
                                      key: PageStorageKey('${index}'),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return Container(
                                            margin: EdgeInsets.only(right: 4.w),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6.h,
                                                horizontal: 16.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              border: Border.all(
                                                color: Color(0xffD9D9D9),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  text: '# ',
                                                  color: StaticColor.main,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                CustomText(
                                                  text: '건강검진하기',
                                                  color: StaticColor.main,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            margin: EdgeInsets.only(right: 4.w),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6.h,
                                                horizontal: 16.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              border: Border.all(
                                                color: Color(0xffD9D9D9),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                CustomText(
                                                  text: '# ',
                                                  color: StaticColor.font_main,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                CustomText(
                                                  text: '아프지마',
                                                  color: StaticColor.font_main,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
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
                        left: 32.w,
                        child: Container(
                          width: 40.w,
                          height: 66.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main_light,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(child: Container()),
                              Container(
                                width: 32.w,
                                height: 32.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                    image: AssetImage('assets/sticker.png'),
                                    fit: BoxFit.contain,
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
            );
          },
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
}
