import 'dart:math';
import 'dart:ui';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/components/triangle_painter.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/pages/diaries.dart';
import 'package:dangdiarysample/pages/home.dart';
import 'package:dangdiarysample/pages/my_page.dart';
import 'package:dangdiarysample/pages/browse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return WillPopScope(
      onWillPop: () async {
        return !(await navigatorKeys[BottomNavController.to.pageIndex]!
            .currentState!
            .maybePop());
      },
      child: Obx(
        () => Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: BottomNavController.to.pageIndex.value,
                children: [
                  Navigator(
                    key: navigatorKeys[0],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Home(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[1],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Diaries(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[2],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Browse(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[3],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => MyPage(),
                      );
                    },
                  ),
                ],
              ),
              IgnorePointer(
                ignoring: BottomNavController.to.isShowBottomModal.value,
                child: AnimatedOpacity(
                  opacity:
                      BottomNavController.to.isShowBottomModal.value ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: double.infinity,
                      height: Get.height,
                      color: Colors.white.withOpacity(0.5),
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 38.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: BottomNavController.to.page.value < 0.5
                                      ? Color(0xff7B61FF)
                                      : Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 38.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: BottomNavController.to.page.value > 0.5
                                      ? Color(0xff7B61FF)
                                      : Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text: BottomNavController.to.page.value < 0.5
                                ? '진행중인 챌린지'
                                : '추천 챌린지',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (28 / 20),
                          ),
                          SizedBox(height: Get.height * 0.85 + 16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: BottomNavController.to.isShowBottomModal.value
                    ? -Get.height
                    : 0,
                left: 0,
                right: 0,
                duration: BottomNavController.to.isShowBottomModal.value
                    ? Duration(milliseconds: 1500)
                    : Duration(milliseconds: 600),
                curve: Cubic(0.175, 0.885, 0.32, 1.07),
                child: Container(
                  width: double.infinity,
                  height: Get.height * 0.85,
                  child: PageView.builder(
                    controller: BottomNavController.to.pageController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/challengeDetail');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                width: double.infinity,
                                height: 112.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80.w,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: AssetImage('assets/dog.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width - 176.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                  text: '반포 한강공원 술래잡기',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: (24 / 16),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w),
                                                height: 22.h,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff7B61FF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '00:00:00 남음',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width - 176.w,
                                          child: CustomText(
                                            text:
                                                '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 ',
                                            color: Color(0xff7D7D7D),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (20 / 14),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _bottomNavBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _bottomNavBack(int index) async {
    if (BottomNavController.to.pageIndex.value == index) {
      navigatorKeys[index]!.currentState?.popUntil((route) => route.isFirst);
    }
  }

  Widget _bottomNavBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ReactiveDevice().hasHomeIndicator() ? 171.h : 137.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: double.infinity,
                  height: ReactiveDevice().hasHomeIndicator() ? 110.h : 76.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.r)),
                    border: Border.all(color: Color(0xffEAEAEA)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ReactiveDevice().hasHomeIndicator() ? 30.h : -4.h,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 80.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _bottomNavigationBarItem(
                            Icons.home,
                            '홈',
                            0,
                          ),
                          _bottomNavigationBarItem(
                            Icons.menu_book,
                            '일기장',
                            1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 64.w),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _bottomNavigationBarItem(
                            Icons.search,
                            '둘러보기',
                            2,
                          ),
                          _bottomNavigationBarItem(
                            Icons.account_circle,
                            'MY',
                            3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 43.h,
            left: Get.width * 0.5 - 32.w,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    BottomNavController.to.changeIsShowBottomModal();
                  },
                  child: Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      color: BottomNavController.to.isShowBottomModal.value
                          ? Colors.white
                          : Color(0xff545454).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(32.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color: Color(0xffD9D9D9),
                                width: 2.r,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16.h,
                          left: 16.w,
                          child: BottomNavController.to.isShowBottomModal.value
                              ? Icon(Icons.add_alert, size: 32.r)
                              : Icon(Icons.clear,
                                  size: 32.r, color: Colors.white),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: Color(0xff7B61FF),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '챌린지',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => BottomNavController.to.pageIndex == 0
                ? Positioned(
                    top: 30.h,
                    left: Get.width * 0.5 - 6.w,
                    child: Transform.rotate(
                      angle: pi,
                      child: CustomPaint(
                        painter: TrianglePainter(
                          strokeColor: Color(0xffA6A6A6),
                          strokeWidth: 10,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        child: Container(
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => BottomNavController.to.pageIndex == 0
                ? Positioned(
                    top: 0,
                    left: Get.width * 0.5 - 95.5.w,
                    child: Container(
                      width: 191.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xffA6A6A6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          '오늘의 일일 챌린지를 확인해보세요!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBarItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _bottomNavBack(index);
        BottomNavController.to.changeBottomNav(index);
        BottomNavController.to.isShowBottomModal(true);
      },
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Icon(
            icon,
            size: 32.r,
            color: BottomNavController.to.pageIndex == index
                ? Colors.orangeAccent
                : Color(0xffA6A6A6),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: BottomNavController.to.pageIndex == index
                      ? Colors.orangeAccent
                      : Color(0xffA6A6A6),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
