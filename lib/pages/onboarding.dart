import 'package:dangdiarysample/components/auto_loop_scroll_view.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  int index = 0;
  List<int> _positionList = [0, 1, 0, 1];
  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(_scrollListener);
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1000));
    _animationController.addListener(_animationListener);
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      if (_pageController.page! >= 3.5) {
        index = 4;
      } else if (_pageController.page! >= 2.5 && _pageController.page! < 3.5) {
        index = 3;
      } else if (_pageController.page! >= 1.5 && _pageController.page! < 2.5) {
        index = 2;
      } else if (_pageController.page! >= 0.5 && _pageController.page! < 1.5) {
        index = 1;
      } else {
        index = 0;
      }
    });
  }

  void _animationListener() {
    setState(() {
      if (_positionList[0] == 1) {
        _positionList = [1, 0, 1, 0];
      } else {
        _positionList = [0, 1, 0, 1];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: StaticColor.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                SizedBox(height: 48.h),
                SizedBox(
                  width: 72.w,
                  height: 10.h,
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: index == 0 ? 16.w : 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color:
                              index == 0 ? StaticColor.main : Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: index == 1 ? 16.w : 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color:
                              index == 1 ? StaticColor.main : Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: index == 2 ? 16.w : 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color:
                              index == 2 ? StaticColor.main : Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: index == 3 ? 16.w : 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color:
                              index == 3 ? StaticColor.main : Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        width: index == 4 ? 16.w : 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color:
                              index == 4 ? StaticColor.main : Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: '매일 업데이트 되는 다양한 챌린지를\n        반려견과 함께 즐겨보세요!',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 74.h,
                                  left: 56.w,
                                  right: 56.w,
                                  child: Image.asset(
                                    'assets/onboarding_images/onboarding_image1.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  top: 46.h,
                                  right: 24.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    width: 199.w,
                                    height: 68.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 10.r,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage('assets/dog.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 117.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: CustomText(
                                                      text: '한강공원 술래잡기',
                                                      color: Colors.black,
                                                      fontSize: 9.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w),
                                                    height: 12.h,
                                                    decoration: BoxDecoration(
                                                      color: StaticColor.main,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '일일 챌린지',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 7.sp,
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
                                              width: 117.w,
                                              child: CustomText(
                                                text:
                                                    '한강 공원 어디에서든 우리 아이와 술래잡기를 해보세요!',
                                                color: Color(0xff7D7D7D),
                                                fontSize: 8.5.sp,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 205.h,
                                  left: 17.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    width: 199.w,
                                    height: 68.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 10.r,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage('assets/dog.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 117.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: CustomText(
                                                      text: '거실에서 노즈워크',
                                                      color: Colors.black,
                                                      fontSize: 9.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w),
                                                    height: 12.h,
                                                    decoration: BoxDecoration(
                                                      color: StaticColor.sub,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '12월 20일까지',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 7.sp,
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
                                              width: 117.w,
                                              child: CustomText(
                                                text:
                                                    '요즘 아이가 스트레스를 받아하진 않나요? 노즈워크로 해소하세요!',
                                                color: Color(0xff7D7D7D),
                                                fontSize: 8.5.sp,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 314.h,
                                  right: 24.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 10.w),
                                    width: 199.w,
                                    height: 68.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 10.r,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage('assets/dog.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 117.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: CustomText(
                                                      text: '강아지 푸딩 요리',
                                                      color: Colors.black,
                                                      fontSize: 9.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4.w),
                                                    height: 12.h,
                                                    decoration: BoxDecoration(
                                                      color: StaticColor.sub,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.r),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '12월 20일까지',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 7.sp,
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
                                              width: 117.w,
                                              child: CustomText(
                                                text:
                                                    '포동포동, 정성스레 만든 강아지용 푸딩을 직접 만들어볼까요?',
                                                color: Color(0xff7D7D7D),
                                                fontSize: 8.5.sp,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
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
                                    height: 186.h,
                                    color: StaticColor.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: 186.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white.withOpacity(0.1),
                                          Colors.white,
                                        ],
                                        stops: [0, 1],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: '          다양한 챌린지를 통해\n차곡차곡 쌓아가는 우리만의 추억',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          SizedBox(height: 46.h),
                          AutoLoopScrollView(
                            enableScrollInput: false,
                            duration: Duration(seconds: 100),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image2_1.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image2_1.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image2_1.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: '   다이어리를 취향껏\n커스텀 할 수도 있어요!',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          SizedBox(height: 46.h),
                          AutoLoopScrollView(
                            enableScrollInput: false,
                            duration: Duration(seconds: 100),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image3_1.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image3_2.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image3_3.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image3_4.png'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 214.w,
                                  height: 390.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/onboarding_images/onboarding_image3_5.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: '    칭찬 스티커를 모아서\n일기장을 꾸며볼 수 있어요!',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 48.h,
                                  left: 56.w,
                                  right: 56.w,
                                  child: Image.asset(
                                    'assets/onboarding_images/onboarding_image4_1.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 318.h,
                                    color: StaticColor.white,
                                  ),
                                ),
                                Positioned(
                                  bottom: 318.h,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 72.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white.withOpacity(0.1),
                                          Colors.white,
                                        ],
                                        stops: [0, 1],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 158.h,
                                  right: 58.w,
                                  child: Container(
                                    width: 137.w,
                                    height: 137.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/onboarding_images/onboarding_image4_2.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 248.h,
                                  left: 68.w,
                                  child: Container(
                                    width: 114.w,
                                    height: 114.w,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/onboarding_images/onboarding_image4_3.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: '     다른 댕댕이들은 뭘 했을까?\n일기장을 엿보고 따라할 수 있어요!',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          SizedBox(height: 46.h),
                          AutoLoopScrollView(
                            enableScrollInput: false,
                            duration: Duration(seconds: 100),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  width: 177.w,
                                  height: 284.h,
                                  child: ShakeWidget(
                                    position: 0,
                                    child: Container(
                                      width: 177.w,
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/onboarding_images/onboarding_image5_1'
                                              '.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  width: 177.w,
                                  height: 284.h,
                                  child: ShakeWidget(
                                    position: 1,
                                    child: Container(
                                      width: 177.w,
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/onboarding_images/onboarding_image5_2'
                                              '.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  width: 177.w,
                                  height: 284.h,
                                  child: ShakeWidget(
                                    position: 0,
                                    child: Container(
                                      width: 177.w,
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/onboarding_images/onboarding_image5_3'
                                              '.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  width: 177.w,
                                  height: 284.h,
                                  child: ShakeWidget(
                                    position: 1,
                                    child: Container(
                                      width: 177.w,
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/onboarding_images/onboarding_image5_4'
                                              '.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 46.h,
              left: 24.w,
              right: 24.w,
              child: GestureDetector(
                onTap: () {
                  Get.offAndToNamed('/registerProfile');
                },
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: StaticColor.main,
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: '댕댕일기 시작하기',
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
      ),
    );
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 3000),
    this.deltaY = 32,
    this.curve = Curves.linear,
    required this.child,
    this.position = 0,
  }) : super(key: key);

  final Duration duration;
  final double deltaY;
  final Widget child;
  final Curve curve;
  final int position;

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double shake(double value) => widget.position == 0
      ? 2 * (0.5 - (0.5 - widget.curve.transform(value)).abs())
      : -2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, widget.deltaY * shake(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}
