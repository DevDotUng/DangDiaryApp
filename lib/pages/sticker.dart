import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/controllers/sticker_controller.dart';
import 'package:dangdiarysample/models/sticker/locked_sticker_model.dart';
import 'package:dangdiarysample/models/sticker/my_sticker_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Sticker extends StatefulWidget {
  const Sticker({Key? key}) : super(key: key);

  @override
  State<Sticker> createState() => _StickerState();
}

class _StickerState extends State<Sticker> {
  @override
  void dispose() {
    Get.delete<StickerController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(StickerController());
    return Obx(
      () => StickerController.to.stickerModel.value == null
          ? const HomeSkeleton()
          : _sticker(context),
    );
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
                  height: 96.h,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: StaticColor.font_main,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        height: (32 / 20),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                '${DiariesController.to.myDiariesModel.value?.dogName}와 함께\n총 ${StickerController.to.stickerModel.value?.numberOfTotalSticker}장 중\n'),
                        TextSpan(
                          text:
                              '${StickerController.to.stickerModel.value?.numberOfSticker}개의 ',
                          style: TextStyle(
                            color: StaticColor.main,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: (32 / 20),
                          ),
                        ),
                        TextSpan(text: '스티커를 모았어요.'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 8.h,
                  color: Color(0xffF5F5F5),
                ),
                SizedBox(height: 16.h),
                _stickerTabBar(),
                SizedBox(height: 8.h),
                GestureDetector(
                  onTap: () => StickerController.to.changeShowLockedSticker(),
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StickerController.to.showLockedSticker.value
                            ? Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: StaticColor.link,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    width: 8.w,
                                    height: 8.w,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main_light,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 16.w,
                                height: 16.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: StaticColor.link,
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
                  ),
                ),
                Obx(
                  () => IndexedStack(
                    index: StickerController.to.tabBarIndex.value,
                    children: [
                      _stickerGridView(
                        StickerController.to.showLockedSticker.value
                            ? StickerController.to.latestOrderList
                            : StickerController.to.myLatestOrderList,
                      ),
                      _stickerGridView(
                        StickerController.to.showLockedSticker.value
                            ? StickerController.to.oldOrderList
                            : StickerController.to.myOldOrderList,
                      ),
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
                        color: StaticColor.main,
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

  Widget _stickerGridView(List<dynamic> orderedList) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 10.h, 20.w, 24.h),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 16.h,
          mainAxisExtent: 196.h,
        ),
        itemCount: orderedList.length,
        itemBuilder: (context, index) {
          if (orderedList[index] is MyStickerModel) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/stickerDetail',
                    arguments: {'challengeId': orderedList[index].challengeId});
              },
              child: Container(
                padding: orderedList[index].stickerShape == 'circle'
                    ? EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w)
                    : EdgeInsets.only(top: 27.h, left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                  color: StaticColor.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color(0xffF5F5F5),
                  ),
                ),
                child: Column(
                  children: [
                    orderedList[index].stickerShape == 'circle'
                        ? Container(
                            width: 124.w,
                            height: 124.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(62.r),
                              image: DecorationImage(
                                image: NetworkImage(PublicRepository()
                                    .getStickerImageUrl(
                                        orderedList[index].stickerImage)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            width: 124.w,
                            height: 105.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.r),
                              image: DecorationImage(
                                image: NetworkImage(PublicRepository()
                                    .getStickerImageUrl(
                                        orderedList[index].stickerImage)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    orderedList[index].stickerShape == 'circle'
                        ? SizedBox(height: 8.h)
                        : SizedBox(height: 16.h),
                    CustomText(
                      text: orderedList[index].challengeTitle,
                      color: Color(0xff222222),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 12),
                    ),
                  ],
                ),
              ),
            );
          } else if (orderedList[index] is LockedStickerModel) {
            return Container(
              padding: orderedList[index].stickerShape == 'circle'
                  ? EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w)
                  : EdgeInsets.only(top: 27.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: StaticColor.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Color(0xffF5F5F5),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: orderedList[index].stickerShape == 'circle'
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed('/stickerDetail');
                                },
                                child: Container(
                                  width: 124.w,
                                  height: 124.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(62.r),
                                    image: DecorationImage(
                                      image: NetworkImage(PublicRepository()
                                          .getStickerImageUrl(
                                              orderedList[index].stickerImage)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Get.toNamed('/stickerDetail');
                                },
                                child: Container(
                                  width: 124.w,
                                  height: 105.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.r),
                                    image: DecorationImage(
                                      image: NetworkImage(PublicRepository()
                                          .getStickerImageUrl(
                                              orderedList[index].stickerImage)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        top: orderedList[index].stickerShape == 'circle'
                            ? 46.h
                            : 36.5.h,
                        left: 46.w,
                        child: StaticIcon(
                          IconsPath.lock_bold,
                          size: 32.w,
                          color: StaticColor.icon,
                        ),
                      ),
                    ],
                  ),
                  orderedList[index].stickerShape == 'circle'
                      ? SizedBox(height: 8.h)
                      : SizedBox(height: 16.h),
                  CustomText(
                    text: '아직 획득하지 못했어요',
                    color: StaticColor.link,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 12),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
