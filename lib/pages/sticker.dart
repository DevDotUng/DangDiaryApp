import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/sticker_controller.dart';
import 'package:dangdiarysample/skeletons/sticker_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Sticker extends StatelessWidget {
  const Sticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StickerController());
    return Obx(
      () =>
          StickerController.to.isLoading.value ? StickerSkeleton() : _sticker(),
    );
  }

  Widget _sticker() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back,
          size: 32.r,
          color: Colors.black,
        ),
        title: CustomText(
          text: '칭찬 스티커',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: Get.width,
              height: Get.height * 0.4,
              color: Color(0xffD9D9D9),
            ),
          ),
          Positioned(
            top: 98.h,
            child: Container(
              width: Get.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: '초코가 모은',
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              height: (32 / 24),
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: '칭찬 스티커는 ',
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  height: (32 / 24),
                                ),
                                CustomText(
                                  text: '16',
                                  color: Color(0xffFF9900),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  height: (32 / 24),
                                ),
                                CustomText(
                                  text: '개에요',
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                  height: (32 / 24),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.book, size: 24.r),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: '밀린 일기',
                              color: Color(0xff7D7D7D),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: (24 / 14),
                            ),
                            SizedBox(width: 4.w),
                            CustomText(
                              text: '3',
                              color: Color(0xffFF9900),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: (24 / 14),
                            ),
                          ],
                        ),
                        SizedBox(width: 24.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/allChallenge');
                            },
                            child: Container(
                              height: 32.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.0.w),
                                      child: CustomText(
                                        text: '모든 챌린지 리스트 보러가기',
                                        color: Color(0xff7D7D7D),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0.w),
                                      child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 16.r),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.only(left: 24.w, top: 24.h),
                    width: Get.width,
                    height: Get.height * 0.63,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: '2022.09',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              height: (24 / 16),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              height: 184.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, jndex) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.0.w),
                                    child: Container(
                                      width: 104.w,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 104.w,
                                            height: 104.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                color: Color(0xffEAEAEA),
                                              ),
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: 80.w,
                                                height: 80.h,
                                                decoration: BoxDecoration(
                                                  color:
                                                      Colors.primaries[jndex],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.r),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          CustomText(
                                            text: '챌린지 이름 챌린지 이름 챌린지 이름',
                                            maxLines: 2,
                                            color: Color(0xff7D7D7D),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (20 / 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
