import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WriteDiaryController extends GetxController {
  static WriteDiaryController get to => Get.find();
  RxString date = DateFormat('yyyy년 MM월 dd일').format(DateTime.now()).obs;
  final ImagePicker _picker = ImagePicker();
  RxList images = [].obs;
  List<String> weathers = ['맑음', '흐림', '비', '눈', '천둥번개', '안개'];
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
  RxInt selectedFeelingsIndex = 9.obs;
  RxBool isPublic = true.obs;
  RxList<int> progress = [1, 0, 0, 0, 0].obs;
  RxList<String> tags = ['한강공원 술래잡기'].obs;
  late TextEditingController tagTextEditingController;

  @override
  void onInit() {
    tagTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
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
    tags.add(tag);
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

  void pickImages(BuildContext context) async {
    final List<XFile>? imageList = await _picker.pickMultiImage();
    if (imageList!.length > 3) {
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
                      Icon(
                        Icons.error,
                        size: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: '사진 개수가 3장을 초과했어요',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 20),
                      ),
                    ],
                  ),
                  CustomText(
                    text: '일기에는 사진을 최대 3장까지 업로드 할 수 있어요.',
                    color: Color(0xff7D7D7D),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 14),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: double.infinity,
                    height: 120.h,
                    color: Colors.grey,
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
                        color: Color(0xff7D7D7D),
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
      progress[3] = 1;
      images(imageList);
    }
  }

  void submitDiary(BuildContext context) {
    if (images.isEmpty) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        builder: (BuildContext buildContext) {
          return Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: '잠깐, 인증 사진을 깜빡하셨군요',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: (24 / 20),
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14).h,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '인증 사진을 1장 이상 올려주셔야 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                      ),
                      TextSpan(
                          text:
                              '일기 제출이 완료돼요!\n\n일기 작성을 그만두고 싶다면 다음에 쓸래요 버튼을 눌러주세요. 이번에 쓰지 않더라도, '),
                      TextSpan(
                        text: '일기장 탭> 밀린 일기 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                      ),
                      TextSpan(text: '에서 언제든지 다시 일기를 이어서 쓸 수 있어요.'),
                    ],
                  ),
                ),
                SizedBox(height: 42.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(buildContext);
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
                              text: '다음에 쓸래요',
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
                          Navigator.pop(buildContext);
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7D7D7D),
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: '앗! 사진도 올릴게요',
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
                SizedBox(height: 40.h),
              ],
            ),
          );
        },
      );
    } else {
      Get.back();
      Get.back();
      Get.toNamed('/completeDiary');
    }
  }
}
