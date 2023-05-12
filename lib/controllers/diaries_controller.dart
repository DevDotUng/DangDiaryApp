import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/models/diaries/diaries_by_cover_model.dart';
import 'package:dangdiarysample/models/diaries/diary_model.dart';
import 'package:dangdiarysample/models/diaries/mydiaries_model.dart';
import 'package:dangdiarysample/repositories/mydiaries_repository.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DiariesController extends GetxController {
  static DiariesController get to => Get.find();

  final myDiariesModel = Rxn<MyDiariesModel>();
  List<Widget> dailyDiaryWidgetList = [];

  RxInt tabBarIndex = 0.obs;
  RxBool diaryHolderBool = false.obs;
  RxBool isSliver = false.obs;
  late ScrollController scrollController;

  List<String> diaryTitles = ['초코와 겨울', '요즘 초코가 기운이 없어ㅠㅠ', '누가 뭐래도 초코가 최고야'];
  List coverColors = [
    Color(0xffFF9686),
    Color(0xffD3E0FF),
    Color(0xffCF8EF5),
  ];
  List holderColors = [
    Color(0xff8BACFF),
    Color(0xffB5C9FF),
    Color(0xffEF7260),
  ];

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    myDiaryInit();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> myDiaryInit() async {
    MyDiariesModel myDiariesModelTemp =
        await MyDiariesRepository().getMyDiariesView();
    myDiariesModel(myDiariesModelTemp);
    if (myDiariesModel.value?.diaries != null) {
      addGridViewItems(myDiariesModel.value!.diaries);
    }
  }

  void addGridViewItems(List<DiariesByCoverModel> diaries) {
    for (DiariesByCoverModel cover in diaries) {
      dailyDiaryWidgetList.add(_dailyCover(cover.coverId, cover.date,
          cover.coverTitle, cover.coverColor, cover.holderColor));
      for (DiaryModel diary in cover.diary) {
        String date = getFormattedDate(diary.endDate);
        dailyDiaryWidgetList.add(_dailyDiary(diary.diaryId, cover.coverId,
            diary.image, date, diary.isLike, diary.numberOfLike));
      }
    }
  }

  String getFormattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('MM월 dd일').format(dateTime);
  }

  void _scrollListener() {
    if (scrollController.offset > 169.h) {
      isSliver(true);
    } else {
      isSliver(false);
    }
  }

  void changeTabBarIndex(int index) {
    if (index == 1) {
      diaryHolderBool(true);
    } else {
      if (scrollController.offset > 169.h) {
        scrollController.animateTo(
          169.h,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
      diaryHolderBool(false);
    }
    tabBarIndex(index);
  }

  double getTabBarPosition(int index) {
    if (index == 1) {
      return 40;
    } else {
      return 0;
    }
  }

  Widget _dailyCover(int coverId, String date, String title, String coverColor,
      String holderColor) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 16.w,
          child: Container(
            width: (Get.width - 55.w) / 2 - 20.w,
            height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
            decoration: BoxDecoration(
              color: Color(0xffEAEAEA),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 8.w,
          child: Container(
            width: (Get.width - 55.w) / 2 - 20.w,
            height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
          width: (Get.width - 55.w) / 2 - 20.w,
          height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
          decoration: BoxDecoration(
            color: Color(0xffB6CAFF),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '${date}',
                color: StaticColor.font_main,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                height: (20 / 12),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 90.w,
                child: Obx(
                  () => CustomText(
                    text: title == null
                        ? '${myDiariesModel.value?.dogName}와의 추억'
                        : '${title}',
                    color: Color(0xff222222),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    height: (20 / 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: ((Get.width - 55.w) / 2 - 20.w) * 1.35 / 2 - 12.h,
          right: 1.5.w,
          child: Obx(
            () => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
              width: DiariesController.to.diaryHolderBool.value ? 8.w : 56.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Color(0xff8BACFF),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dailyDiary(int diaryId, int coverId, String image, String date,
      bool isLike, int numberOfLike) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      width: (Get.width - 55.w) / 2 - 20.w,
      height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: NetworkImage(PublicRepository().getDiaryImageUrl(image)),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                height: 24.h,
                decoration: BoxDecoration(
                  color: StaticColor.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    '${date}',
                    style: TextStyle(
                      color: StaticColor.font_main,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              StaticIcon(
                IconsPath.like_outlined,
                size: 16.r,
                color: StaticColor.white,
              ),
              SizedBox(width: 16.w),
              Text(
                '${numberOfLike}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        ],
      ),
    );
  }
}
