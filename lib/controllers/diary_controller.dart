import 'dart:math';

import 'package:dangdiarysample/components/cover_color.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/random_position_sticker.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/controllers/home_controller.dart';
import 'package:dangdiarysample/controllers/my_page_controller.dart';
import 'package:dangdiarysample/models/challenge_detail/overdue_diary_model.dart';
import 'package:dangdiarysample/models/diary/diary_with_cover_model.dart';
import 'package:dangdiarysample/models/diary/mydiary_model.dart';
import 'package:dangdiarysample/repositories/browse_repository.dart';
import 'package:dangdiarysample/repositories/diary_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

enum coverColors {
  RED,
  PEACH,
  CHERRY,
  ORANGE,
  YELLOW,
  LEMON,
  GREEN,
  LIME,
  LEAF,
  MINT,
  BLUE,
  SKY,
  PUPLE,
  LAVENDER,
  PINK,
}

enum holderColors {
  HOLDER_RED,
  HOLDER_PEACH,
  HOLDER_CHERRY,
  HOLDER_ORANGE,
  HOLDER_YELLOW,
  HOLDER_LEMON,
  HOLDER_GREEN,
  HOLDER_LIME,
  HOLDER_LEAF,
  HOLDER_MINT,
  HOLDER_BLUE,
  HOLDER_SKY,
  HOLDER_PUPLE,
  HOLDER_LAVENDER,
  HOLDER_PINK,
}

class DiaryController extends GetxController {
  static DiaryController get to => Get.find();
  late BuildContext context;
  late int coverId;
  late int? diaryId;
  DiaryController(
      {required this.context, required this.coverId, required this.diaryId});

  final diaryWithCoverModel = Rxn<DiaryWithCoverModel>();

  var week = ["일", "월", "화", "수", "목", "금", "토"];
  static DateTime now = DateTime.now();

  RxInt year = 0.obs;
  RxInt month = 0.obs;
  RxList days = [].obs;

  late FToast fToast;
  RxInt pageIndex = 0.obs;
  List<PageController> pageViewControllerList = [];
  List<RxBool> isLikeList = [];
  List<RxInt> pageViewIndexList = [];
  RxBool isShowEditDiaryColorModal = false.obs;
  RxInt coverIndex = 10.obs;
  RxInt holderIndex = 10.obs;
  RxInt coverTempIndex = 10.obs;
  RxInt holderTempIndex = 10.obs;
  late TextEditingController titleTextEditingController;
  late ScrollController scrollController;

  @override
  void onInit() async {
    fToast = FToast();
    fToast.init(context);
    titleTextEditingController = TextEditingController();
    await initPageViews();
    setFirst(DateTime.now().year, DateTime.now().month);
    setCoverIndexAndHolderIndex();
    setCoverTempIndexAndHolderTempIndex();
    scrollController = ScrollController();
    if (diaryId != null) {
      for (int i = 0; i < diaryWithCoverModel.value!.diaries.length; i++) {
        if (diaryWithCoverModel.value!.diaries[i].diaryId == diaryId) {
          scrollController =
              ScrollController(initialScrollOffset: Get.width * (i + 2));
          break;
        }
      }
    }
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    super.dispose();
  }

  Future<void> initPageViews() async {
    DiaryWithCoverModel diaryWithCoverModelTemp =
        await DiaryRepository().getDiaryView(coverId);
    diaryWithCoverModel(diaryWithCoverModelTemp);

    for (int i = 0; i < diaryWithCoverModel.value!.diaries.length; i++) {
      pageViewControllerList.add(PageController());
      pageViewIndexList.add(0.obs);
      pageViewControllerList[i].addListener(() {
        pageScrollListener(i);
      });
      isLikeList.add(diaryWithCoverModel.value!.diaries[i].isLike.obs);
    }
  }

  setFirst(int setYear, int setMonth) {
    year(setYear);
    month(setMonth);
    insertDays(year.value, month.value);
  }

  insertDays(int year, int month) {
    days.clear();

    /*
      이번달 채우기
      => 이번달의 마지막날을 구해 1일부터 마지막 날까지 추기
    */
    int lastDay = DateTime(year, month + 1, 0).day;
    for (var i = 1; i <= lastDay; i++) {
      List stickerList = [];
      for (var j = 0; j < diaryWithCoverModel.value!.diaries.length; j++) {
        DateTime dateTime =
            DateTime.parse(diaryWithCoverModel.value!.diaries[j].endDate);
        int dayOfWeek = int.parse(DateFormat('dd').format(dateTime));
        if (dayOfWeek == i) {
          stickerList.add({
            'stickerImage': diaryWithCoverModel.value!.diaries[j].stickerImage,
            'stickerShape': diaryWithCoverModel.value!.diaries[j].stickerShape
          });
        }
      }
      days.add({
        "year": year,
        "month": month,
        "day": i,
        "inMonth": true,
        "sticker": stickerList,
      });
    }

    /*
      이번달 1일의 요일 : DateTime(year, month, 1).weekday
      => 7이면(일요일) 상관x
      => 아니면 비어있는 요일만큼 지난달 채우기
    */
    if (DateTime(year, month, 1).weekday != 7) {
      var temp = [];
      int prevLastDay = DateTime(year, month, 0).day;
      for (var i = DateTime(year, month, 1).weekday - 1; i >= 0; i--) {
        temp.add(null);
      }
      days = [...temp, ...days].obs;
    }

    /*
      6줄을 유지하기 위해 남은 날 채우기
      => 6*7 = 42. 42개까지
    */
    var temp = [];
    for (var i = 1; i <= 42 - days.length; i++) {
      temp.add(null);
    }

    days = [...days, ...temp].obs;
  }

  void scrollListener() {
    pageIndex(scrollController.offset ~/ Get.width);
    pageIndex.refresh();
  }

  void pageScrollListener(int index) {
    if (pageViewControllerList[index].page! % 1 < 0.5) {
      pageViewIndexList[index](pageViewControllerList[index].page!.toInt());
    } else {
      pageViewIndexList[index](pageViewControllerList[index].page!.toInt() + 1);
    }
  }

  String getNumberOfDiaries(int number) {
    switch (number) {
      case 1:
        return '일일의 이야기';
      case 2:
        return '이일의 이야기';
      case 3:
        return '삼일의 이야기';
      case 4:
        return '사일의 이야기';
      case 5:
        return '오일의 이야기';
      case 6:
        return '육일의 이야기';
      case 7:
        return '칠일의 이야기';
      case 8:
        return '팔일의 이야기';
      case 9:
        return '구일의 이야기';
      case 10:
        return '십일의 이야기';
      case 11:
        return '십일일의 이야기';
      case 12:
        return '십이일의 이야기';
      case 13:
        return '십삼일의 이야기';
      case 14:
        return '십사일의 이야기';
      case 15:
        return '십오일의 이야기';
      case 16:
        return '십육일의 이야기';
      case 17:
        return '십칠일의 이야기';
      case 18:
        return '십팔일의 이야기';
      case 19:
        return '십구일의 이야기';
      case 20:
        return '이십일의 이야기';
      case 21:
        return '이십일일의 이야기';
      case 22:
        return '이십이일의 이야기';
      case 23:
        return '이십삼일의 이야기';
      case 24:
        return '이십사일의 이야기';
      case 25:
        return '이십오일의 이야기';
      case 26:
        return '이십육일의 이야기';
      case 27:
        return '이십칠일의 이야기';
      case 28:
        return '이십팔일의 이야기';
      case 29:
        return '이십구일의 이야기';
      case 30:
        return '삼십일의 이야기';
      case 31:
        return '삼십일일의 이야기';
      default:
        return '여러날의 이야기';
    }
  }

  void setCoverIndexAndHolderIndex() {
    if (diaryWithCoverModel.value?.coverColor != null) {
      coverIndex(CoverColor().coverColorList.indexOf(
          CoverColor().getCoverColor(diaryWithCoverModel.value!.coverColor)));
    } else {
      coverIndex(10);
    }
    if (diaryWithCoverModel.value?.holderColor != null) {
      holderIndex(CoverColor().holderColorList.indexOf(
          CoverColor().getHolderColor(diaryWithCoverModel.value!.holderColor)));
    } else {
      holderIndex(10);
    }
  }

  void setCoverTempIndexAndHolderTempIndex() {
    if (diaryWithCoverModel.value?.coverColor != null) {
      coverTempIndex(CoverColor().coverColorList.indexOf(
          CoverColor().getCoverColor(diaryWithCoverModel.value!.coverColor)));
    } else {
      coverTempIndex(10);
    }
    if (diaryWithCoverModel.value?.holderColor != null) {
      holderTempIndex(CoverColor().holderColorList.indexOf(
          CoverColor().getHolderColor(diaryWithCoverModel.value!.holderColor)));
    } else {
      holderTempIndex(10);
    }
  }

  String getFormattedDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('yyyy년 MM월 dd일 ').format(dateTime);
    String dayOfWeek = DateFormat.E('ko_KR').format(dateTime);
    String result = formattedDate + dayOfWeek + '요일';

    return result;
  }

  String getFeeling(type) {
    String feeling;
    final map = {
      '기뻐요': IconsPath.happy,
      '즐거워요': IconsPath.fun,
      '차분해요': IconsPath.happy,
      '활기차요': IconsPath.full_energy,
      '화나요': IconsPath.angry,
      '짜증나요': IconsPath.annoying,
      '두려워요': IconsPath.afraid,
      '불안해요': IconsPath.nervous,
      '모르겠어요': IconsPath.dont_know,
    };
    feeling = map[type] ?? IconsPath.happy;

    return feeling;
  }

  String getWeather(type) {
    String weather;
    final map = {
      '맑음': IconsPath.sunny_bold,
      '흐림': IconsPath.cloudy_bold,
      '비': IconsPath.rain_bold,
      '눈': IconsPath.snow_bold,
      '천둥번개': IconsPath.thunder_bold,
      '안개': IconsPath.fog_bold,
    };
    weather = map[type] ?? IconsPath.sunny_bold;

    return weather;
  }

  void likeDiary(int index) async {
    int diaryId = diaryWithCoverModel.value!.diaries[index].diaryId;
    bool isLike = diaryWithCoverModel.value!.diaries[index].isLike;

    int statusCode = await BrowseRepository().likeDiary(diaryId);

    if (statusCode == 200) {
      if (isLike) {
        diaryWithCoverModel.value!.diaries[index].numberOfLike =
            diaryWithCoverModel.value!.diaries[index].numberOfLike - 1;
      } else {
        diaryWithCoverModel.value!.diaries[index].numberOfLike =
            diaryWithCoverModel.value!.diaries[index].numberOfLike + 1;
      }
      diaryWithCoverModel.value!.diaries[index].isLike = !isLike;
      diaryWithCoverModel.refresh();

      pageIndex(scrollController.offset ~/ Get.width);
    }
  }

  void changeisLike(int index) {
    isLikeList[index](!isLikeList[index].value);
  }

  void changeCoverIndex(int index) {
    coverTempIndex(index);
  }

  void changeHolderIndex(int index) {
    holderTempIndex(index);
  }

  void changeDiaryTitle(String title) async {
    if (title.length <= 14 && title.isNotEmpty) {
      int statusCode = await DiaryRepository().editCoverTitle(coverId, title);
      if (statusCode == 201) {
        Navigator.pop(context);
        diaryWithCoverModel.value?.coverTitle = title;
        diaryWithCoverModel.refresh();
      }
    }
  }

  void applyColors() async {
    int statusCode = await DiaryRepository().editCoverColor(
        coverId,
        CoverColor().getCoverColorString(
            CoverColor().coverColorList[coverTempIndex.value]),
        CoverColor().getHolderColorString(
            CoverColor().holderColorList[holderTempIndex.value]));
    if (statusCode == 201) {
      coverIndex(coverTempIndex.value);
      holderIndex(holderTempIndex.value);
      diaryWithCoverModel.value?.coverColor = CoverColor().getCoverColorString(
          CoverColor().coverColorList[coverTempIndex.value]);
      diaryWithCoverModel.value?.holderColor = CoverColor()
          .getHolderColorString(
              CoverColor().holderColorList[holderTempIndex.value]);
      diaryWithCoverModel.refresh();
    }
  }

  void changeIsPublicDiary() async {
    int _page = scrollController.offset ~/ Get.width;
    bool _isPublic = diaryWithCoverModel.value!.diaries[_page - 2].isPublic;
    int statusCode = await DiaryRepository().changeIsPublicDiary(
        diaryWithCoverModel.value!.diaries[_page - 2].diaryId, !_isPublic);
    if (statusCode == 201) {
      Navigator.pop(context);
      showToast(_isPublic ? IconsPath.lock_bold : IconsPath.unlock_bold,
          '이 일기가 ${_isPublic ? '비' : ''}공개 되었어요!');
      diaryWithCoverModel.value!.diaries[_page - 2].isPublic = !_isPublic;
      diaryWithCoverModel.refresh();

      pageIndex(_page);
    }
  }

  showToast(String iconsPath, String text) {
    double _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Widget toast = Container(
      width: Get.width - 48.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Color(0xff7D7D7D),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StaticIcon(
            iconsPath,
            size: 24.r,
            color: Colors.white,
          ),
          SizedBox(width: 4.w),
          CustomText(
            text: text,
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: _statusBarHeight + 8.h,
            left: 24.w,
          );
        });
  }

  double getDiagonalLength(double size) {
    return sqrt(size * size + (size * 0.7) * (size * 0.7));
  }

  void changeIsShowEditDiaryColorModal(bool isShow) {
    isShowEditDiaryColorModal(isShow);
  }

  void editDiaryCover(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      builder: (BuildContext buildContext) {
        return Container(
          padding: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showEditTitleDialog(context);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '다이어리 제목 편집',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  changeIsShowEditDiaryColorModal(true);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '다이어리 색상 편집',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDeleteAllDiaryDialog(context);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '이 달의 일기 모두 삭제하기',
                        color: Color(0xffF02E2E),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  void editDiary(BuildContext context) {
    int _page = scrollController.offset ~/ Get.width;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      builder: (BuildContext buildContext) {
        return Container(
          padding: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  changeIsPublicDiary();
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text:
                            '이 일기 ${diaryWithCoverModel.value!.diaries[_page - 2].isPublic ? '비' : ''}공개하기',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () async {
                  Box homeBox = await Hive.openBox('userInfo');
                  int userId = homeBox.get('userId');

                  int diaryId =
                      diaryWithCoverModel.value!.diaries[_page - 2].diaryId;
                  int challengeId =
                      diaryWithCoverModel.value!.diaries[_page - 2].challengeId;
                  String endDate =
                      diaryWithCoverModel.value!.diaries[_page - 2].endDate;
                  String weather =
                      diaryWithCoverModel.value!.diaries[_page - 2].weather;
                  String feeling =
                      diaryWithCoverModel.value!.diaries[_page - 2].feeling;
                  String title =
                      diaryWithCoverModel.value!.diaries[_page - 2].title;
                  String content =
                      diaryWithCoverModel.value!.diaries[_page - 2].content;
                  bool isPublic =
                      diaryWithCoverModel.value!.diaries[_page - 2].isPublic;
                  List<String> tags =
                      diaryWithCoverModel.value!.diaries[_page - 2].tags;

                  Navigator.pop(context);
                  Get.toNamed('/writeDiary', arguments: {
                    'writeType': 'edit',
                    'overdueDiary': OverdueDiaryModel(
                      diaryId: diaryId,
                      userId: userId,
                      challengeId: challengeId,
                      endDate: endDate,
                      weather: weather,
                      feeling: feeling,
                      title: title,
                      content: content,
                      isPublic: isPublic,
                      tags: tags,
                    ),
                    'title': diaryWithCoverModel
                        .value!.diaries[_page - 2].tags[0]
                        .replaceAll('_', ' '),
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '일기를 수정할래요',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDeleteDiaryDialog(context);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '일기를 삭제할래요',
                        color: Color(0xffF02E2E),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  void showEditTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 24.r,
                      color: Color(0xff202020),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '다이어리 제목을 입력해주세요.',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: titleTextEditingController,
                  maxLength: 14,
                  cursorColor: Colors.black,
                  cursorHeight: 24.h,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (24 / 14).h,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        '${diaryWithCoverModel.value?.coverTitle == null ? '' : diaryWithCoverModel.value!.coverTitle + ' '}(최대 14글자)',
                    hintStyle: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 14).h,
                    ),
                    counter: Container(),
                    contentPadding: EdgeInsets.only(top: 8.h),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 8.w,
                      maxHeight: 7.h,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                              text: '취소할게요',
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
                          changeDiaryTitle(titleTextEditingController.text);
                          DiariesController.to.myDiaryInit();
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.main,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '저장할게요',
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
              ],
            ),
          ),
        );
      },
    );
  }

  void showDeleteAllDiaryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StaticIcon(
                      IconsPath.trash,
                      size: 24.r,
                      color: StaticColor.error,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '모든 일기를 삭제할까요?',
                      color: StaticColor.font_main,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '한번 삭제된 일기의 내용과 사진들은 다시 복구할 수 없습니다.',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illusts/delete_diary.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r),
                            border: Border.all(
                              color: StaticColor.line,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '취소할게요',
                              color: StaticColor.link,
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
                        onTap: () async {
                          Navigator.pop(context);
                          List<int> diaryIds = [];
                          for (MyDiaryModel diary
                              in diaryWithCoverModel.value!.diaries) {
                            diaryIds.add(diary.diaryId);
                          }
                          int statusCode = await DiaryRepository()
                              .deleteAllThisMonthDiaries(coverId, diaryIds);
                          if (statusCode == 204) {
                            HomeController.to.homeInit();
                            DiariesController.to.myDiaryInit();
                            MyPageController.to.myPageInit();
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.error,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '삭제할래요',
                              color: StaticColor.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showDeleteDiaryDialog(BuildContext context) {
    int _page = scrollController.offset ~/ Get.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StaticIcon(
                      IconsPath.trash,
                      size: 24.r,
                      color: StaticColor.error,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '일기를 삭제할까요?',
                      color: StaticColor.font_main,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '한번 삭제된 일기의 내용과 사진들은 다시 복구할 수 없습니다.',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illusts/delete_diary.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r),
                            border: Border.all(
                              color: StaticColor.line,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '취소할게요',
                              color: StaticColor.link,
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
                        onTap: () async {
                          Navigator.pop(context);
                          int statusCode = await DiaryRepository().deleteDiary(
                              coverId,
                              diaryWithCoverModel
                                  .value!.diaries[_page - 2].diaryId);
                          if (statusCode == 204) {
                            HomeController.to.homeInit();
                            DiariesController.to.myDiaryInit();
                            MyPageController.to.myPageInit();
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: StaticColor.error,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '삭제할래요',
                              color: StaticColor.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
