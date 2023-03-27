import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/write_diary_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WriteDiaryController extends GetxController {
  static WriteDiaryController get to => Get.find();
  RxString date = DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).obs;
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
  RxList<String> tags = ['한강공원_술래잡기'].obs;
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

  void changePublic() {
    isPublic(!isPublic.value);
  }

  void changeWeather(int index) {
    if (selectedWeatherIndex.value == 6) {
      progress[1] = 1;
    }
    selectedWeatherIndex(index);
  }

  void changeFeelings(int index) {
    if (selectedFeelingsIndex.value == 9) {
      progress[2] = 1;
    }
    selectedFeelingsIndex(index);
  }

  int getProgress() {
    return progress[0] + progress[1] + progress[2] + progress[3] + progress[4];
  }

  void addTag(String tag) {
    String filteredString = getFilteredString(tag);
    if (tag.isNotEmpty) {
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
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy년 MM월 dd일').format(pickedDate);
      date(formattedDate);
    } else {}
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
      int challengeId = 1;
      String endDate = getEndDate(date.value);
      String title;
      if (titleTextEditingController.text.isEmpty) {
        title = '한강공원 술래잡기';
      } else {
        title = titleTextEditingController.text;
      }
      List<String> imagePaths = getImagePaths();
      int statusCode = await WriteDiaryRepository().writeDiary(
        userId,
        challengeId,
        endDate,
        weathers[selectedWeatherIndex.value],
        feelings[selectedFeelingsIndex.value],
        title,
        contentTextEditingController.text,
        imagePaths,
        tags,
        isPublic.value,
      );

      if (statusCode == 201) {
        Get.offAndToNamed('/completeDiary');
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
}
