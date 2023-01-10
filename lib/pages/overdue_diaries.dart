import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/overdue_diaries_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverdueDiaries extends StatelessWidget {
  const OverdueDiaries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OverdueDiariesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 32.r,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: '밀린 일기',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              controller: OverdueDiariesController.to.scrollController,
              children: [
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 68.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '지금까지\n'),
                            TextSpan(
                              text: '4장',
                              style: TextStyle(
                                color: Color(0xff7B61FF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                height: (32 / 20),
                              ),
                            ),
                            TextSpan(text: '의 밀린 일기가 있어요.'),
                          ],
                        ),
                      ),
                      Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0.r),
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 29.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '쓴 일기',
                              color: Color(0xffA6A6A6),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (20 / 12),
                            ),
                            CustomText(
                              text: '995장',
                              color: Color(0xff6B6B6B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (24 / 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 1.w,
                        height: 22.h,
                        color: Color(0xffEAEAEA),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '밀린 일기',
                              color: Color(0xffA6A6A6),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (20 / 12),
                            ),
                            CustomText(
                              text: '4장',
                              color: Color(0xff6B6B6B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (24 / 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 1.w,
                        height: 22.h,
                        color: Color(0xffEAEAEA),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '칭찬 스티커',
                              color: Color(0xffA6A6A6),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (20 / 12),
                            ),
                            CustomText(
                              text: '499장',
                              color: Color(0xff6B6B6B),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: (24 / 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  height: 8.h,
                  color: Color(0xffF5F5F5),
                ),
                SizedBox(height: 8.h),
                _diariesTabBar(),
                _overdueDiaries(),
              ],
            ),
            Positioned(
              child: Obx(
                () => OverdueDiariesController.to.isSliver.value
                    ? _diariesTabBar()
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _diariesTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: double.infinity,
      height: 46.h,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  OverdueDiariesController.to.changeTabBarIndex(0);
                },
                child: SizedBox(
                  width: 75.w,
                  child: Center(
                    child: Text(
                      '마감임박순',
                      style: TextStyle(
                        color: Color(0xff545454),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 14),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  OverdueDiariesController.to.changeTabBarIndex(1);
                },
                child: SizedBox(
                  width: 63.w,
                  child: Center(
                    child: Text(
                      '진행도순',
                      style: TextStyle(
                        color: Color(0xff545454),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 2.h,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(1.r),
            ),
            child: Stack(
              children: [
                Obx(
                  () => AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    top: 0,
                    bottom: 0,
                    left: OverdueDiariesController.to
                        .getTabBarPosition(
                            OverdueDiariesController.to.tabBarIndex.value)
                        .w,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: OverdueDiariesController.to
                          .getTabBarWidth(
                              OverdueDiariesController.to.tabBarIndex.value)
                          .w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: Color(0xff7B61FF),
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _overdueDiaries() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 20.w, 24.h),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            width: double.infinity,
            height: 112.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Color(0xffEAEAEA)),
            ),
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage('assets/dog.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 16.r,
                          color: Color(0xff7D7D7D),
                        ),
                        SizedBox(width: 2.w),
                        CustomText(
                          text: '03:58:11 남음',
                          color: Color(0xff7D7D7D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: (14 / 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: Get.width - 176.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: '한강공원 술래잡기',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: (24 / 16),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 20.r,
                            color: Color(0xffA6A6A6),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    CustomText(
                      text: '인증 사진 추가부터',
                      color: Color(0xff7B61FF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 12),
                    ),
                    Container(
                      width: Get.width - 176.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: (Get.width - 176.w) / 5 * 3,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: Color(0xff9C88FF),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
