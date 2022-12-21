import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
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
              Icons.calendar_month_outlined,
              color: Colors.black,
              size: 21.r,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 24.0.w),
              width: double.infinity,
              height: 72.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(-0.1, -0.1),
                          blurRadius: 4.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0.1, 0.1),
                          blurRadius: 4.0,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage('assets/dog.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '초코와 일기를 시작한지 000일',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: (20 / 14).h,
                      ),
                      Container(
                        width: Get.width - 152.w,
                        child: Row(
                          children: [
                            CustomText(
                              text: '일기 000장 ',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              height: (20 / 12).h,
                            ),
                            CustomText(
                              text: '받은 도장 00개 ',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              height: (20 / 12).h,
                            ),
                            CustomText(
                              text: '총 좋아요 00개',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              height: (20 / 12).h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 24.0.w),
              width: double.infinity,
              height: 52.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '00개의 밀린 일기가 있어요!',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 14).h,
                  ),
                  Icon(Icons.arrow_forward_ios_sharp, size: 16.r),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.w,
                    mainAxisSpacing: 8.h,
                    mainAxisExtent: 229.h,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Positioned(
                          top: 16.h,
                          left: 16.w,
                          child: Container(
                            width: Get.width / 2 - 43.5.w,
                            height: 213.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFDF393),
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: AssetImage('assets/dog.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8.h,
                          left: 8.w,
                          child: Container(
                            width: Get.width / 2 - 43.5.w,
                            height: 213.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFDF393),
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: AssetImage('assets/dog2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.all(16.0.r),
                            width: Get.width / 2 - 43.5.w,
                            height: 213.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFDF393),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width / 2 - 43.5.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '2022년 8월',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (18 / 12).h,
                                      ),
                                      SizedBox(height: 8.h),
                                      CustomText(
                                        text: '초코와 여름.',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width / 2 - 43.5.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                      CustomText(
                                        text: '19일의 이야기',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (20 / 12).h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
