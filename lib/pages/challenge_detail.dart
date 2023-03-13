import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/expandable_text.dart';
import 'package:dangdiarysample/components/later_dialog.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/challenge_detail_controller.dart';
import 'package:dangdiarysample/skeletons/challenge_detail_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChallengeDetail extends StatelessWidget {
  const ChallengeDetail({Key? key}) : super(key: key);

  void _showDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '잘했어요!\n이제 일기를 쓰러 가볼까요?',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 130.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(65.0.r),
                  ),
                ),
                SizedBox(height: 6.h),
                CustomText(
                  text: '일기를 쓰면 이 칭찬스티커를 받을 수 있어요!',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (24 / 14),
                ),
                SizedBox(height: 29.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/writeDiary');
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: StaticColor.main,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '일기를 쓰러 갈래요',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    text: '다음에 쓸게요',
                    color: Color(0xff6B6B6B),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 12),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLaterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LaterDialog(onClose: () {
          ChallengeDetailController.to.setIsChallenge(false);
        });
      },
    );
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    Get.put(ChallengeDetailController());
    Get.put(BottomNavController());
    return Obx(
      () => ChallengeDetailController.to.isLoading.value
          ? ChallengeDetailSkeleton()
          : _challengeDetailWidget(context),
    );
  }

  Widget _challengeDetailWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            CustomScrollView(
              controller: ChallengeDetailController.to.scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Obx(
                      () => Icon(
                        Icons.arrow_back,
                        size: 32.r,
                        color:
                            ChallengeDetailController.to.scrollPosition > 150.h
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  pinned: true,
                  expandedHeight: 228.h,
                  primary: true,
                  flexibleSpace: Stack(
                    children: [
                      FlexibleSpaceBar(
                        background: SizedBox(
                          height: Get.width,
                          width: Get.width,
                          child: Image.asset(
                            'assets/challenge_sample1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                        child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.none,
                          background: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.black38, Colors.transparent],
                                stops: [0.0, 0.15],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2.h,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                      FlexibleSpaceBar(
                        collapseMode: CollapseMode.none,
                        background: Stack(
                          children: [
                            Positioned(
                              bottom: ChallengeDetailController
                                  .to.scrollPosition.value,
                              right: 44.w,
                              child: Container(
                                width: 52.w,
                                height: 32.h,
                                color: Color(0xffFFB872),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '한강공원 술래잡기',
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  height: (32 / 24),
                                ),
                                SizedBox(height: 16.h),
                                ChallengeDetailController.to.isChallenge.value
                                    ? Row(
                                        children: [
                                          StaticIcon(
                                            IconsPath.history,
                                            size: 24.r,
                                            color: StaticColor.font_main,
                                          ),
                                          SizedBox(width: 4.w),
                                          CustomText(
                                            text:
                                                '${twoDigits(BottomNavController.to.duration.value.inHours)}:${twoDigits(BottomNavController.to.duration.value.inMinutes.remainder(60))}:${twoDigits(BottomNavController.to.duration.value.inSeconds.remainder(60))}',
                                            color: StaticColor.font_main,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (24 / 16),
                                          ),
                                        ],
                                      )
                                    : CustomText(
                                        text: '처음 도전하는 챌린지에요!',
                                        color: StaticColor.font_main,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        height: (24 / 16),
                                      ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              width: 52.w,
                              height: 54.h,
                              decoration: BoxDecoration(
                                color: Color(0xffFFB872),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(26.r),
                                  bottomRight: Radius.circular(26.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                    width: 44.w,
                                    height: 44.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22.r),
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
                          ],
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ExpandableText(
                                ChallengeDetailController.to.challengeContent,
                                expandText: '더보기',
                                collapseText: '접기',
                                maxLines: 4,
                                linkColor: Color(0xffA6A6A6),
                                animation: true,
                                animationDuration: Duration(milliseconds: 500),
                                style: TextStyle(
                                  color: Color(0xff6B6B6B),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: (24 / 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 16.w),
                          width: 327.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: StaticColor.sub_light,
                            ),
                            borderRadius: BorderRadius.circular(15.0.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '인증 방법',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: (24 / 16),
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                width: Get.width - 80.w,
                                child: CustomText(
                                  text:
                                      '공공장소 하네스 착용은 필수! 보호자가 2인 이상 함께하는 걸 권장해요. 하네스를 착용하고 한강공원에서 술래잡기 하는 사진을 1장 이상 찍어 업로드하면 돼요. ',
                                  maxLines: 10,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: (20 / 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '다른 아이들은 이렇게 했어요!',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              height: (24 / 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/posts');
                              },
                              child: StaticIcon(
                                IconsPath.forward_bold,
                                size: 20.r,
                                color: StaticColor.font_main,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 88.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8.0.w),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/posts");
                                  },
                                  child: Container(
                                    width: 104.w,
                                    height: 88.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.0.r),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/challenge_detail_sample${index + 1}.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 118.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 46.h),
                width: double.infinity,
                height: 102.h,
                color: StaticColor.white,
                child: Obx(
                  () => ChallengeDetailController.to.isChallenge.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  _showLaterDialog(context);
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
                                      text: '다음에 할게요',
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
                                  _showDoneDialog(context);
                                },
                                child: Container(
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    color: StaticColor.main,
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: '다했어요!',
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            ChallengeDetailController.to.setIsChallenge(true);
                          },
                          child: Container(
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: StaticColor.main,
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                            child: Center(
                              child: CustomText(
                                text: '도전할래요',
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
