import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllChallengeController extends GetxController {
  late BuildContext context;
  AllChallengeController({required this.context});

  static AllChallengeController get to => Get.find();
  RxList<String> categoryList = ['전체', '산책', '간식', '여행', '훈련', '장난감'].obs;
  RxInt selectedCategory = 0.obs;
  RxBool isSearch = false.obs;
  RxList overduedDiarys = [1].obs;

  @override
  void onReady() {
    _showDoneDialog(context);
    super.onReady();
  }

  void changeCategory(int index) {
    selectedCategory(index);
  }

  void search() {
    isSearch(true);
  }

  RxBool isFolded = true.obs;
  void fold(bool folded) {
    isFolded(folded);
  }

  void _showDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 26.0.h),
            width: double.infinity,
            height: 420.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '앗!\n예전에 미룬 챌린지가 있어요',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 20).h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.clear, size: 18.r),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: Obx(
                    () => isFolded.value
                        ? _twoOverduedChallenge()
                        : _overduedChallengeList(),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Color(0xff7D7D7D),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: '일주일 뒤에 다시 알려주세요',
                        color: Color(0xff7D7D7D),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _twoOverduedChallenge() {
    return Padding(
      padding: EdgeInsets.only(left: 26.w, right: 26.w),
      child: Column(
        children: [
          ...List.generate(
            2,
            (index) => _overduedChallengeWidget(0.h, 8.h, 0.w, 0.w),
          ),
          GestureDetector(
            onTap: () {
              fold(!isFolded.value);
            },
            child: Container(
              width: double.infinity,
              height: 32.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16.r,
                    color: Color(0xff00C2FF),
                  ),
                  CustomText(
                    text: '8개',
                    color: Color(0xff00C2FF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overduedChallengeList() {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _overduedChallengeWidget(4.h, 4.h, 26.w, 26.w);
        },
      ),
    );
  }

  Widget _overduedChallengeWidget(double topMargin, double bottomMargin,
      double leftMargin, double rightMargin) {
    return Container(
      margin: EdgeInsets.only(
          top: topMargin,
          bottom: bottomMargin,
          left: leftMargin,
          right: rightMargin),
      width: double.infinity,
      height: 92.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 12.w),
          Container(
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0.r),
              image: DecorationImage(
                image: AssetImage('assets/dog.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.0.h),
                  child: CustomText(
                    text: '한강공원 술래잡기',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: Get.width - 203.w,
                  child: CustomText(
                    text: '한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기',
                    maxLines: 2,
                    color: Color(0xff7D7D7D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (16 / 12).h,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
