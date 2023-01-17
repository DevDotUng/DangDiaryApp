import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/sticker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Sticker extends StatelessWidget {
  const Sticker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StickerController());
    return _sticker(context);
  }

  Widget _sticker(BuildContext context) {
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
          text: '칭찬 스티커',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/searchDiary');
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 32.r,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              controller: StickerController.to.scrollController,
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
                            TextSpan(text: '총 1000장 중에\n'),
                            TextSpan(
                              text: '455개의 ',
                              style: TextStyle(
                                color: Color(0xff7B61FF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                height: (32 / 20),
                              ),
                            ),
                            TextSpan(text: '스티커를 모았어요.'),
                          ],
                        ),
                      ),
                      Container(
                        width: 56.w,
                        height: 56.w,
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
                SizedBox(height: 16.h),
                _stickerTabBar(),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 16.w,
                      height: 16.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: Color(0xff7D7D7D7),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: '미보유 스티커 보기',
                      color: Color(0xff7D7D7D),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 12),
                    ),
                    SizedBox(width: 24.w),
                  ],
                ),
                Obx(
                  () => IndexedStack(
                    index: StickerController.to.tabBarIndex.value,
                    children: [
                      _stickerGridView(),
                      _stickerGridView(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              child: Obx(
                () => StickerController.to.isSliver.value
                    ? _stickerTabBar()
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stickerTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: double.infinity,
      height: 38.h,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  StickerController.to.changeTabBarIndex(0);
                },
                child: SizedBox(
                  width: 78.w,
                  child: Center(
                    child: Text(
                      '최근 획득순',
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
                  StickerController.to.changeTabBarIndex(1);
                },
                child: SizedBox(
                  width: 63.w,
                  child: Center(
                    child: Text(
                      '오래된순',
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
                    left: StickerController.to
                        .getTabBarPosition(
                            StickerController.to.tabBarIndex.value)
                        .w,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: StickerController.to
                          .getTabBarWidth(
                              StickerController.to.tabBarIndex.value)
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

  Widget _stickerGridView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 10.h, 20.w, 24.h),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 196.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                index % 2 == 0
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed('/stickerDetail');
                        },
                        child: Container(
                          width: 108.w,
                          height: 108.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(54.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0, 4.h),
                                blurRadius: 10.r,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('assets/sticker.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.toNamed('/stickerDetail');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8.h),
                          width: 119.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0, 4.h),
                                blurRadius: 10.r,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('assets/sticker.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '전기담요에서 간식먹기',
                  color: Color(0xff222222),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
