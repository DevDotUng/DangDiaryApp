import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WriteDiaryController extends GetxController {
  static WriteDiaryController get to => Get.find();
  RxString date = DateFormat('yyyy.MM.dd').format(DateTime.now()).obs;
  final ImagePicker _picker = ImagePicker();
  RxList images = [].obs;

  void changeDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy.MM.dd').format(pickedDate);
      date(formattedDate);
    } else {}
  }

  void pickImages() async {
    final List<XFile>? imageList = await _picker.pickMultiImage();
    images(imageList);
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
                  height: (24 / 20).h,
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
