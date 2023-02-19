import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterProfileController extends GetxController {
  static RegisterProfileController get to => Get.find();
  RxInt pageIndex = 0.obs;
  final ImagePicker _picker = ImagePicker();
  Rx<XFile>? profileImage;
  List<String> breedList = ['비글', '포메라니안', '말티즈'];
  List<String> genderList = ['암컷', '수컷'];
  RxString breed = '비글'.obs;
  String tempBreed = '비글';
  RxString birth = '2022.01.31'.obs;
  String tempBirth = '2022.01.31';
  RxInt age = 0.obs;
  RxString gender = '암컷'.obs;
  String tempGender = '암컷';
  RxBool isBlankDogName = true.obs;
  RxBool isBlankUserName = true.obs;
  late TextEditingController dogNameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    dogNameTextEditingController = TextEditingController();
    userNameTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    dogNameTextEditingController.dispose();
    userNameTextEditingController.dispose();
    super.dispose();
  }

  void changeDogNameBlank(String text) {
    if (text.isEmpty) {
      isBlankDogName(true);
    } else {
      isBlankDogName(false);
    }
  }

  void changeUserNameBlank(String text) {
    if (text.isEmpty) {
      isBlankUserName(true);
    } else {
      isBlankUserName(false);
    }
  }

  void changeAge(DateTime value) {
    DateTime currentDate = DateTime.now();

    int yearNow = currentDate.year;
    int monthNow = currentDate.month;
    int dayOfMonthNow = currentDate.day;

    int yearBirth = value.year;
    int monthBirth = value.month;
    int dayOfMonthBirth = value.day;

    int tempAge = yearNow - yearBirth;

    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) {
          tempAge--;
        }
      } else {
        tempAge--;
      }
    }

    age(tempAge);
  }

  void nextPage() {
    if (pageIndex.value == 4) {
      Get.offAndToNamed('/app');
    } else {
      pageIndex(pageIndex.value + 1);
    }
  }

  void previousPage() {
    if (pageIndex.value != 0) {
      pageIndex(pageIndex.value - 1);
    }
  }

  Future<void> pickImage(BuildContext context) async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    profileImage!(image);
    print(profileImage);
  }

  Future<void> showCupertinoBreedPicker(BuildContext context) async {
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
                      breed(tempBreed);
                    },
                    child: CustomText(
                      text: '완료',
                      color: Color(0xff387CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
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
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    children: breedList
                        .map((item) => Center(
                              child: Text(
                                item,
                                style: TextStyle(fontSize: 22),
                              ),
                            ))
                        .toList(),
                    onSelectedItemChanged: (index) {
                      tempBreed = breedList[index];
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showCupertinoBirthPicker(BuildContext context) async {
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
                      birth(tempBirth);
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
                    initialDateTime:
                        DateFormat('yyyy.MM.dd').parse(birth.value),
                    onDateTimeChanged: (DateTime value) {
                      if (value != null) {
                        String formattedDate =
                            DateFormat('yyyy.MM.dd').format(value);
                        tempBirth = formattedDate;
                        changeAge(value);
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
  }

  Future<void> showCupertinoGenderPicker(BuildContext context) async {
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
                      gender(tempGender);
                    },
                    child: CustomText(
                      text: '완료',
                      color: Color(0xff387CF6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: (20 / 16),
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
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 40,
                    children: genderList
                        .map((item) => Center(
                              child: Text(
                                item,
                                style: TextStyle(fontSize: 22),
                              ),
                            ))
                        .toList(),
                    onSelectedItemChanged: (index) {
                      tempGender = genderList[index];
                    },
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
