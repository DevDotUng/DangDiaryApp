import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/all_challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllChallenge extends StatelessWidget {
  const AllChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AllChallengeController(context: context));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        AllChallengeController.to.removeHighlightOverlay();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const CustomBackButton(),
          ),
          centerTitle: true,
          title: CustomText(
            text: '모든 챌린지 리스트',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: (32 / 16),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: Colors.white,
          child: Column(
            children: [
              Obx(
                () => AllChallengeController.to.overdueDiaries.length == 0
                    ? Container()
                    : _overdueDiary(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.padding, size: 24.r),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: '모든 챌린지 리스트',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: (24 / 16),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Divider(color: Color(0xffEBEBEB), thickness: 1.h),
              Container(
                width: double.infinity,
                height: 24.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AllChallengeController.to.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            AllChallengeController.to.changeCategory(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 11.w),
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: index ==
                                      AllChallengeController
                                          .to.selectedCategory.value
                                  ? Color(0xffA6A6A6)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                AllChallengeController.to.categoryList[index],
                                style: TextStyle(
                                  color: index ==
                                          AllChallengeController
                                              .to.selectedCategory.value
                                      ? Colors.white
                                      : Color(0xffB6B6B6),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Divider(color: Color(0xffEBEBEB), height: 0, thickness: 1.h),
              _searchBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color(0xff7D7D7D7),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: '미달성 챌린지만 볼래요',
                    color: Color(0xff7D7D7D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 14),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7.w,
                    mainAxisSpacing: 8.h,
                    mainAxisExtent: 174.h,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/challengeDetail');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: AssetImage('assets/dog.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: '챌린지 이름 챌린지\n이름 챌린지',
                            color: Color(0xff7D7D7D),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 4.0.h, bottom: 7.h),
      child: Column(
        children: [
          CompositedTransformTarget(
            link: AllChallengeController.to.layerLink,
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: TextField(
                onTap: () {
                  AllChallengeController.to.createOverlay('');
                },
                onChanged: (String text) {
                  AllChallengeController.to.changeTextListener(text);
                  AllChallengeController.to.createOverlay(text);
                },
                cursorColor: Color(0xff202020),
                cursorWidth: 1.w,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xff0A0A0A),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (24 / 14).h,
                ),
                decoration: InputDecoration(
                  hintText: '어떤 챌린지를 찾아볼까요?',
                  hintStyle: TextStyle(
                    color: Color(0xffA6A6A6),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (24 / 14).h,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 24.r,
                    color: Colors.black,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overdueDiary() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.collections_bookmark, size: 24.r),
            SizedBox(width: 4.w),
            CustomText(
              text: '밀린 일기',
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: (24 / 16),
            ),
            SizedBox(width: 4.w),
            CustomText(
              text: '3',
              color: Color(0xffFF9900),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: (24 / 16),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Container(
          height: 104.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 4.h, bottom: 4.h, left: 4.w, right: 16.w),
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  width: Get.width * 0.75,
                  height: 104.h,
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
                      Container(
                        width: 87.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          image: DecorationImage(
                            image: AssetImage('assets/dog.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '한강공원 술래잡기',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 6.h),
                          CustomText(
                            text: '2022.09.01에 했어요',
                            color: Color(0xff7D7D7D),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 4.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '임시 저장된 일기쓰기 ',
                                    style: TextStyle(
                                      color: Color(0xff7D7D7D),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '30%',
                                    style: TextStyle(
                                      color: Color(0xffFF9900),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: Get.width * 0.75 - 119.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      width: (190 / 100 * 30).w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFF9900),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
