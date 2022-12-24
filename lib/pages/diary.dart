import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/diary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class Diary extends StatelessWidget {
  Diary({Key? key}) : super(key: key);

  String postContent =
      '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
      '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
      '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
      '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
      '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 ';

  @override
  Widget build(BuildContext context) {
    Get.put(DiaryController());
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
          text: '일기장',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16).h,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 21.r,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Swiper(
          itemCount: 3,
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
            ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
            ..addTranslate([
              Offset(-470.0.w, -40.0.h),
              Offset(0.0, 0.0),
              Offset(470.0.w, -40.0.h)
            ]),
          itemWidth: Get.width - 48.w,
          itemHeight: Get.height * 0.82,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xffFDF393),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  children: [
                    ...List.generate(
                      5,
                      (index) => _random_position_sticker(
                        DiaryController.to.randomPositionStickerList[0][index],
                        DiaryController.to.randomPositionStickerList[1][index],
                      ),
                    ),
                    Positioned(
                      top: 90.h,
                      left: 24.w,
                      child: CustomText(
                        text: '2022년 8월',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: (20 / 16).h,
                      ),
                    ),
                    Positioned(
                      top: 130.h,
                      left: 24.w,
                      child: CustomText(
                        text: '일기장 제목을 입력',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (21 / 20).h,
                      ),
                    ),
                    Positioned(
                      top: 170.h,
                      left: 24.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '19일의 이야기',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (16 / 12).h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 14.r,
                                color: Color(0xffFF9900),
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: '000',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: (20 / 12).h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.4 - 10.h,
                      right: 24.w,
                      child: CustomText(
                        text: '<< 페이지를 넘겨보세요',
                        color: Color(0xff6A6A6A),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 11).h,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16.h),
                              CustomText(
                                text: '초코와 술래잡기',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: (20 / 16).h,
                              ),
                              CustomText(
                                text: '서울 성북구 유니크원 카페',
                                color: Color(0xff7E7E7E),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: '2022년 9월 11일 월요일',
                                    color: Color(0xff1D1D1D),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    height: (20 / 12).h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.wb_sunny_outlined, size: 16.r),
                                      SizedBox(width: 8.w),
                                      Icon(Icons.sentiment_very_satisfied_sharp,
                                          size: 16.r),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: double.infinity,
                                height: 380.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffC4C4C4),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 207,
                                    child: Container(
                                      width: 100.w,
                                      height: 43.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF5F5F5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 8.w),
                                          Icon(Icons.golf_course, size: 16.r),
                                          SizedBox(width: 8.w),
                                          CustomText(
                                            text: '애견카페 방문기 작성하기',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (24 / 14).h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    flex: 96,
                                    child: Container(
                                      width: 100.w,
                                      height: 43.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF5F5F5),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.heart_broken, size: 18.r),
                                          CustomText(
                                            text: '119',
                                            color: Color(0xff1D1D1D),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              CustomText(
                                text: postContent,
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (20 / 14).h,
                              ),
                              SizedBox(height: 53.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 38.h),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          loop: false,
        ),
      ),
    );
  }

  Widget _random_position_sticker(double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          image: DecorationImage(
            image: AssetImage('assets/dog.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
