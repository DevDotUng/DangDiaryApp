import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/home_controller.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(
      () => HomeController.to.isLoading.value ? HomeSkeleton() : _homeWidget(),
    );
  }

  Widget _homeWidget() {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => Image.asset(
                    HomeController
                        .to.imageList[HomeController.to.mainIndex.toInt()],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.20),
            ],
          ),
          Positioned(
            top: 90.h,
            left: 24.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: '오늘은 초코가',
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  height: (32 / 24).h,
                ),
                CustomText(
                  text: '한강공원 산책을 가고\n싶어해요!',
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: (32 / 24).h,
                ),
              ],
            ),
          ),
          Positioned(
            top: 90.h,
            right: 24.w,
            child: GestureDetector(
              onTap: () {
                BottomNavController.to.changeBottomNav(3);
              },
              child: Container(
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
            ),
          ),
          Positioned(
            bottom: Get.height * 0.3 + 32.h,
            left: 24.w,
            child: Container(
              width: 49.w,
              height: 209.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25.0.r),
              ),
              child: Obx(
                () => PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: HomeController.to.pageController,
                  itemCount: HomeController.to.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 37.h,
                      child: Center(
                        child: Obx(
                          () => Text(
                            '${index + 1}',
                            style: TextStyle(
                              color:
                                  index == HomeController.to.mainIndex.toInt()
                                      ? Colors.white
                                      : Colors.grey,
                              fontSize:
                                  index == HomeController.to.mainIndex.toInt()
                                      ? 24.sp
                                      : 20.sp,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          _customBottomSheet(),
        ],
      ),
    );
  }

  Widget _customBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: Get.height * 0.9,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
            ),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 4.h),
                height: Get.height * 0.9,
                width: Get.width,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      SizedBox(height: 32.h),
                      ...List.generate(
                        10,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 24.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 24.0.w),
                                  child: Row(
                                    children: [
                                      Icon(Icons.rocket),
                                      SizedBox(height: 4.h),
                                      CustomText(
                                        text: '진행 중인 챌린지',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (24 / 16).h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 24.0.w),
                                  child: CustomText(
                                    text: '현재 효림님이 초코와 진행 중인 챌린지에요',
                                    color: Color(0xff7D7D7D),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: (20 / 14).h,
                                  ),
                                ),
                                Container(
                                  height: 128.h,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed('/challengeDetail');
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0.w),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                              top: 8.h,
                                              left: 4.w,
                                              right: 4.w,
                                              bottom: 16.h,
                                            ),
                                            width: Get.width * 0.8,
                                            height: 128.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.0.r),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.15),
                                                  blurRadius: 4.0,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 12.w),
                                                Container(
                                                  width: 87.w,
                                                  height: 80.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7.0.r),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/dog.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12.0.w,
                                                      horizontal: 8.0.h),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 3.h),
                                                        child: CustomText(
                                                          text: '한강공원 술래잡기',
                                                          color: Colors.black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: Get.width * 0.8 -
                                                            119.w,
                                                        child: Text(
                                                          '한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff7D7D7D),
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            height: (20 / 14).h,
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
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8.0.h, bottom: 24.0.h),
                        width: 48.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0.r),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
