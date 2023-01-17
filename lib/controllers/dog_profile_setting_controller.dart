import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DogProfileSettingController extends GetxController {
  static DogProfileSettingController get to => Get.find();
  List<String> breedList = ['비글', '포메라니안', '말티즈'];
  List<String> genderList = ['암컷', '수컷'];
  RxString breed = '비글'.obs;
  String tempBreed = '비글';
  RxString birth = '2022.01.31'.obs;
  String tempBirth = '2022.01.31';
  RxString gender = '암컷'.obs;
  String tempGender = '암컷';

  late TextEditingController dogNameTextEditingController;
  late TextEditingController userNicknameTextEditingController;

  @override
  void onInit() {
    dogNameTextEditingController = TextEditingController(text: '초코');
    userNicknameTextEditingController = TextEditingController(text: '오또캐드');
    super.onInit();
  }

  @override
  void dispose() {
    dogNameTextEditingController.dispose();
    userNicknameTextEditingController.dispose();
    super.dispose();
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
                            DateFormat('yyyy.MM.dd').format(value);
                        tempBirth = formattedDate;
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
