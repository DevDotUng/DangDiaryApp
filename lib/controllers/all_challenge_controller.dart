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
  RxList overdueDiaries = [1].obs;
  RxList searchHistory =
      ['산책하기', '간식주기', '건강검진하기', '중란천 산책하기', '캠핑가기', '몰라유'].obs;
  List<String> autoCompleteWords = [
    '산책하기',
    '간식주기',
    '건강검진하기',
    '중랑천 산책하기',
    '캠핑가기',
    '몰라유',
  ];
  RxList autoCompleteWord = [].obs;

  @override
  void onReady() {
    _showDoneDialog(context);
    super.onReady();
  }

  @override
  void dispose() {
    removeHighlightOverlay();
    super.dispose();
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

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  void createOverlay(String text) {
    removeHighlightOverlay();

    assert(overlayEntry == null);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          width: Get.width - 64.w,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(8.w, 40.h),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: Offset(0, 4.h),
                    blurRadius: 4.r,
                  ),
                ],
              ),
              child: Obx(() => text.isEmpty
                  ? _searchHistoryWidget()
                  : _autoCompleteWidget()),
            ),
          ),
        );
      },
    );
    Overlay.of(context)?.insert(overlayEntry!);
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void changeTextListener(String text) {
    autoCompleteWord.clear();
    for (String word in autoCompleteWords) {
      if (word.contains(text)) {
        autoCompleteWord.add(word);
      }
    }
  }

  Widget _searchHistoryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: '이전 검색 기록',
          color: Color(0xff757575),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: (24 / 12),
          decoration: TextDecoration.none,
        ),
        SizedBox(height: 8.h),
        ...List.generate(
          AllChallengeController.to.searchHistory.length < 5
              ? AllChallengeController.to.searchHistory.length
              : 5,
          (index) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AllChallengeController.to.searchHistory[index],
                    color: Color(0xff0A0A0A),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (24 / 12),
                    decoration: TextDecoration.none,
                  ),
                  GestureDetector(
                    onTap: () {
                      searchHistory.removeAt(index);
                    },
                    child: Icon(Icons.clear, size: 12.r),
                  ),
                ],
              ),
              Divider(
                color: Color(0xffEBEBEB),
                height: 9.h,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _autoCompleteWidget() {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: autoCompleteWord.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AllChallengeController.to.autoCompleteWord[index],
              color: Color(0xff0A0A0A),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: (24 / 12),
              decoration: TextDecoration.none,
            ),
            Divider(
              color: Color(0xffEBEBEB),
              height: 9.h,
            ),
          ],
        );
      },
    );
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
                        height: (24 / 20),
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
                Obx(
                  () => isFolded.value
                      ? _twoOverduedChallenge()
                      : _overduedChallengeList(),
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
                SizedBox(height: 24.h),
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
    return Container(
      height: 239.h,
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
                    height: (16 / 12),
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
