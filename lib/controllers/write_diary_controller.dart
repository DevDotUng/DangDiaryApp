import 'dart:io';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/models/challenge_detail/overdue_diary_model.dart';
import 'package:dangdiarysample/models/write_diary/complete_diary_model.dart';
import 'package:dangdiarysample/repositories/write_diary_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WriteDiaryController extends GetxController {
  late String writeType;
  late OverdueDiaryModel overdueDiary;
  late String title;
  WriteDiaryController(
      {required this.writeType, required this.overdueDiary, this.title = ''});

  static WriteDiaryController get to => Get.find();
  RxString date = DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).obs;
  String tempDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());
  final ImagePicker _picker = ImagePicker();
  RxList images = [].obs;
  List<String> weathers = ['맑음', '흐림', '비', '눈', '천둥번개', '안개'];
  List<String> weatherIcons = [
    IconsPath.sunny_bold,
    IconsPath.cloudy_bold,
    IconsPath.rain_bold,
    IconsPath.snow_bold,
    IconsPath.thunder_bold,
    IconsPath.fog_bold,
  ];
  RxInt selectedWeatherIndex = 6.obs;
  List<String> feelings = [
    '기뻐요',
    '즐거워요',
    '차분해요',
    '활기차요',
    '화나요',
    '짜증나요',
    '두려워요',
    '불안해요',
    '모르겠어요'
  ];
  List<String> feelingIcons = [
    IconsPath.happy,
    IconsPath.fun,
    IconsPath.happy,
    IconsPath.full_energy,
    IconsPath.angry,
    IconsPath.annoying,
    IconsPath.afraid,
    IconsPath.nervous,
    IconsPath.dont_know,
  ];
  RxInt selectedFeelingsIndex = 9.obs;
  RxBool isPublic = true.obs;
  RxList<int> progress = [1, 0, 0, 0, 0].obs;
  RxList essentialTextList = [
    SizedBox(height: 16.h),
    SizedBox(height: 16.h),
    SizedBox(height: 16.h),
    SizedBox(height: 16.h),
    SizedBox(height: 16.h),
  ].cast<Widget>().toList().obs;
  RxBool isShake = false.obs;
  RxBool isShowPopup = false.obs;
  RxString titleTag = ''.obs;
  RxList tags = [].obs;
  RxBool isLoading = false.obs;
  late TextEditingController titleTextEditingController;
  late TextEditingController contentTextEditingController;
  late TextEditingController tagTextEditingController;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    titleTextEditingController = TextEditingController();
    contentTextEditingController = TextEditingController();
    tagTextEditingController = TextEditingController();
    setOverdueDiary();
    tags.add(getFilteredString(titleTag.value));
    if (writeType == 'edit') {
      progress[3] = 1;
      tags = overdueDiary.tags.obs;
    }
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    titleTextEditingController.dispose();
    contentTextEditingController.dispose();
    tagTextEditingController.dispose();
    super.dispose();
  }

  void setOverdueDiary() {
    date(DateFormat('yyyy년 MM월 dd일')
        .format(DateTime.parse(overdueDiary.endDate)));
    setWeather(overdueDiary.weather);
    if (selectedWeatherIndex.value != 6) {
      progress[1] = 1;
    }
    setFeeling(overdueDiary.feeling);
    if (selectedFeelingsIndex.value != 9) {
      progress[2] = 1;
    }
    titleTag(title);
    if (overdueDiary.title != null) {
      titleTextEditingController.text = overdueDiary.title!;
    }
    if (overdueDiary.content != null) {
      contentTextEditingController.text = overdueDiary.content!;
      if (contentTextEditingController.text.isEmpty) {
        progress[4] = 0;
      } else {
        progress[4] = 1;
      }
    }
    isPublic(overdueDiary.isPublic);
  }

  void changePublic() {
    isPublic(!isPublic.value);
  }

  void changeWeather(int index) {
    selectedWeatherIndex(index);
    if (selectedWeatherIndex.value != 6) {
      progress[1] = 1;
    }
  }

  void changeFeelings(int index) {
    selectedFeelingsIndex(index);
    if (selectedFeelingsIndex.value != 9) {
      progress[2] = 1;
    }
  }

  int getProgress() {
    return progress[0] + progress[1] + progress[2] + progress[3] + progress[4];
  }

  void addTag(String tag) {
    String filteredString = getFilteredString(tag);
    if (filteredString.isNotEmpty && filteredString != '_') {
      tags.add(filteredString);
    }
  }

  String getFilteredString(String text) {
    RegExp basicReg = RegExp("[^ㄱ-ㅎ가-힣0-9a-zA-Z\\s_]");
    String filteredString = text;
    filteredString = filteredString.replaceAll(basicReg, "");
    filteredString = filteredString.replaceAll(RegExp(r"\s+"), "_");

    return filteredString;
  }

  void removeTag(int index) {
    tags.removeAt(index);
  }

  void changeDate(BuildContext context) async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup(
        context: context,
        builder: (context) => SizedBox(
          height: 260.h,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 44.h,
                color: Color(0xffF0F1F4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        date(tempDate);
                      },
                      child: CustomText(
                        text: '완료',
                        color: Color(0xff387CF6),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 16),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 216.h,
                padding: const EdgeInsets.only(top: 6.0),
                color: CupertinoColors.white,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 22,
                  ),
                  child: SafeArea(
                    top: false,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime value) {
                        if (value != null) {
                          String formattedDate =
                              DateFormat('yyyy년 MM월 dd일').format(value);
                          tempDate = formattedDate;
                        } else {}
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: StaticColor.main, // header background color
                onPrimary: StaticColor.font_main, // header text color
                onSurface: StaticColor.sub_deeper, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: StaticColor.sub_deeper, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null) {
        String formattedDate = DateFormat('yyyy년 MM월 dd일').format(pickedDate);
        date(formattedDate);
      } else {}
    }
  }

  void changeContentListener(String content) {
    if (content.isEmpty) {
      progress[4] = 0;
    } else {
      progress[4] = 1;
    }
  }

  Future<void> pickImages(BuildContext context) async {
    final List<XFile>? imageList = await _picker.pickMultiImage();
    if (imageList!.length + images.length > 10) {
      showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      StaticIcon(
                        IconsPath.caution,
                        size: 24.r,
                        color: StaticColor.font_main,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '사진 개수가 10장을 초과했어요',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 20),
                      ),
                    ],
                  ),
                  CustomText(
                    text: '일기에는 사진을 최대 10장까지 업로드 할 수 있어요.',
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
                          image: AssetImage('assets/illusts/exceed_images.png'),
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(buildContext);
                      pickImages(context);
                    },
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      child: Center(
                        child: CustomText(
                          text: '다시 고를게요',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      if (imageList.isEmpty) {
        progress[3] = 0;
      } else {
        progress[3] = 1;
      }
      images.addAll(imageList);
    }
  }

  void submit() async {
    List<int> isCompletes = [];
    for (int i = 0; i < 5; i++) {
      if (progress[i] == 0) {
        isCompletes.add(i);
        essentialTextList[i] = Padding(
          padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
          child: Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: isShake.value ? 10.w : 0,
                ),
              ),
              CustomText(
                text: '* 필수 답변 항목이에요!',
                color: StaticColor.main,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: (20 / 14),
              ),
            ],
          ),
        );
      }
    }

    if (isCompletes.isEmpty) {
      int userId = await getUserId();
      int challengeIdArgument = overdueDiary.challengeId;
      String endDate = getEndDate(date.value);
      String titleArgument;
      if (titleTextEditingController.text.isEmpty) {
        titleArgument = title;
      } else {
        titleArgument = titleTextEditingController.text;
      }
      List<String> tagArgument = [];
      for (dynamic tag in tags) {
        tagArgument.add(tag);
      }
      List<String> imagePaths = getImagePaths();
      isLoading(true);
      CompleteDiaryModel? completeDiaryModel =
          await WriteDiaryRepository().writeDiary(
        overdueDiary.diaryId,
        userId,
        challengeIdArgument,
        endDate,
        weathers[selectedWeatherIndex.value],
        feelings[selectedFeelingsIndex.value],
        titleArgument,
        contentTextEditingController.text,
        imagePaths,
        tagArgument,
        isPublic.value,
      );
      isLoading(true);

      if (completeDiaryModel != null) {
        BottomNavController.to.challengeInit();
        DiariesController.to.myDiaryInit();
        Get.offAndToNamed('/completeDiary', arguments: {
          'completeDiaryModel': completeDiaryModel,
          'title': titleArgument
        });
      }
    } else {
      double height;
      switch (isCompletes[0]) {
        case 0:
        case 1:
          height = 149.h;
          break;
        case 2:
          height = 469.h;
          break;
        case 3:
          height = 1034.h;
          break;
        case 4:
          height = 1226.h;
          break;
        default:
          height = 149.h;
          break;
      }
      scrollController.animateTo(
        height,
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
    }
  }

  void editDiary() async {
    List<int> isCompletes = [];
    for (int i = 0; i < 5; i++) {
      if (progress[i] == 0) {
        isCompletes.add(i);
        essentialTextList[i] = Padding(
          padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
          child: Row(
            children: [
              Obx(
                () => AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: isShake.value ? 10.w : 0,
                ),
              ),
              CustomText(
                text: '* 필수 답변 항목이에요!',
                color: StaticColor.main,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: (20 / 14),
              ),
            ],
          ),
        );
      }
    }

    if (isCompletes.isEmpty) {
      int userId = await getUserId();
      int challengeIdArgument = overdueDiary.challengeId;
      String endDate = getEndDate(date.value);
      String titleArgument;
      if (titleTextEditingController.text.isEmpty) {
        titleArgument = title;
      } else {
        titleArgument = titleTextEditingController.text;
      }
      List<String> tagArgument = [];
      for (dynamic tag in tags) {
        tagArgument.add(tag);
      }
      List<String> imagePaths = getImagePaths();
      isLoading(true);
      int statusCode = await WriteDiaryRepository().editDiary(
        overdueDiary.diaryId,
        endDate,
        weathers[selectedWeatherIndex.value],
        feelings[selectedFeelingsIndex.value],
        titleArgument,
        contentTextEditingController.text,
        imagePaths,
        tagArgument,
        isPublic.value,
      );
      isLoading(true);

      if (statusCode == 201) {
        BottomNavController.to.challengeInit();
        DiariesController.to.myDiaryInit();
        Get.back();
        Get.back();
      }
    } else {
      double height;
      switch (isCompletes[0]) {
        case 0:
        case 1:
          height = 149.h;
          break;
        case 2:
          height = 469.h;
          break;
        case 3:
          height = 1034.h;
          break;
        case 4:
          height = 1226.h;
          break;
        default:
          height = 149.h;
          break;
      }
      scrollController.animateTo(
        height,
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
      await Future.delayed(Duration(milliseconds: 100), () {
        isShake(!isShake.value);
      });
    }
  }

  void overdue() async {
    String endDate = getEndDate(date.value);
    String? weatherArgument = selectedWeatherIndex.value == 6
        ? null
        : weathers[selectedWeatherIndex.value];
    String? feelingArgument = selectedFeelingsIndex.value == 9
        ? null
        : feelings[selectedFeelingsIndex.value];
    String? titleArgument = titleTextEditingController.text.isEmpty
        ? null
        : titleTextEditingController.text;
    String? contentArgument = contentTextEditingController.text.isEmpty
        ? null
        : contentTextEditingController.text;
    int statusCode = await WriteDiaryRepository().overdueDiary(
      overdueDiary.diaryId,
      overdueDiary.userId,
      overdueDiary.challengeId,
      endDate,
      weatherArgument,
      feelingArgument,
      titleArgument,
      contentArgument,
      isPublic.value,
    );
    if (statusCode == 200) {
      Get.back();
    }
  }

  Future<int> getUserId() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    return userId;
  }

  String getEndDate(String date) {
    DateTime parseDate = DateFormat("yyyy'년' MM'월' dd'일'").parse(date);
    String endDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(parseDate);

    return endDate;
  }

  List<String> getImagePaths() {
    List<String> imagePaths = [];
    images.value.forEach((image) {
      imagePaths.add(image!.path);
    });

    return imagePaths;
  }

  void changeIsShowPopup() {
    isShowPopup(!isShowPopup.value);
  }

  void setWeather(String? weather) {
    switch (weather) {
      case '맑음':
        selectedWeatherIndex(0);
        return;
      case '흐림':
        selectedWeatherIndex(1);
        return;
      case '비':
        selectedWeatherIndex(2);
        return;
      case '눈':
        selectedWeatherIndex(3);
        return;
      case '천둥번개':
        selectedWeatherIndex(4);
        return;
      case '안개':
        selectedWeatherIndex(5);
        return;
      default:
        selectedWeatherIndex(6);
        return;
    }
  }

  void setFeeling(String? feeling) {
    switch (feeling) {
      case '기뻐요':
        selectedFeelingsIndex(0);
        return;
      case '즐거워요':
        selectedFeelingsIndex(1);
        return;
      case '차분해요':
        selectedFeelingsIndex(2);
        return;
      case '활기차요':
        selectedFeelingsIndex(3);
        return;
      case '화나요':
        selectedFeelingsIndex(4);
        return;
      case '짜증나요':
        selectedFeelingsIndex(5);
        return;
      case '두려워요':
        selectedFeelingsIndex(6);
        return;
      case '불안해요':
        selectedFeelingsIndex(7);
        return;
      case '모르겠어요':
        selectedFeelingsIndex(8);
        return;
      default:
        selectedFeelingsIndex(9);
        return;
    }
  }
}
