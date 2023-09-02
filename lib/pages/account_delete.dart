import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/controllers/my_page_controller.dart';
import 'package:dangdiarysample/repositories/login_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AccountDelete extends StatelessWidget {
  const AccountDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              width: 32.w,
              child: Icon(
                Icons.arrow_back,
                size: 32.r,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: CustomText(
          text: '계정 삭제',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18.h),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: StaticColor.font_main,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: (32 / 20),
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '${MyPageController.to.myPageModel.value!.nickname}님과 ${DiariesController.to.myDiariesModel.value?.dogName}와 일기를 쓴 지\n'),
                  TextSpan(
                    text: '${DiariesController.to.myDiariesModel.value?.date}일',
                    style: TextStyle(
                      color: StaticColor.main,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (32 / 20),
                    ),
                  ),
                  TextSpan(text: '이 되었고\n'),
                  ...DiariesController.to.myDiariesModel.value?.numberOfDiary ==
                          0
                      ? [TextSpan(text: '추억을 시작하려 해요!')]
                      : [
                          TextSpan(
                            text:
                                '${DiariesController.to.myDiariesModel.value?.numberOfDiary}장',
                            style: TextStyle(
                              color: StaticColor.main,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              height: (32 / 20),
                            ),
                          ),
                          TextSpan(text: '의 일기를 썼어요'),
                        ],
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/illusts/delete_account.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomText(
              text: '계정을 삭제하면 작성한 일기, 칭찬 스티커, 좋아요 등 활동 정보가 모두 삭제됩니다.',
              color: StaticColor.font_main,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: (24 / 16),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () async {
                int statusCode = await LoginRepository().deleteAccount();
                if (statusCode == 200) {
                  Box homeBox = await Hive.openBox('userInfo');
                  homeBox.put('userId', null);
                  Box searchBox = await Hive.openBox('searchHistory');
                  searchBox.put('diarySearch', null);
                  searchBox.put('postsSearch', null);
                  Get.offAllNamed('/login');
                }
              },
              child: Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: StaticColor.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: StaticColor.error),
                ),
                child: Center(
                  child: Text(
                    '계정 삭제',
                    style: TextStyle(
                      color: StaticColor.error,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 47.h),
          ],
        ),
      ),
    );
  }
}
