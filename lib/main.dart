import 'dart:io';

import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/pages/account_setting.dart';
import 'package:dangdiarysample/pages/all_challenge.dart';
import 'package:dangdiarysample/pages/app_setting.dart';
import 'package:dangdiarysample/pages/challenge_detail.dart';
import 'package:dangdiarysample/app.dart';
import 'package:dangdiarysample/pages/complete_diary.dart';
import 'package:dangdiarysample/pages/complete_inquiry.dart';
import 'package:dangdiarysample/pages/customer_center.dart';
import 'package:dangdiarysample/pages/diaries.dart';
import 'package:dangdiarysample/pages/diary.dart';
import 'package:dangdiarysample/pages/dog_profile_setting.dart';
import 'package:dangdiarysample/pages/login.dart';
import 'package:dangdiarysample/pages/my_inquiry_history.dart';
import 'package:dangdiarysample/pages/my_inquiry_history_detail.dart';
import 'package:dangdiarysample/pages/my_page.dart';
import 'package:dangdiarysample/pages/my_report_history.dart';
import 'package:dangdiarysample/pages/my_report_history_detail.dart';
import 'package:dangdiarysample/pages/notice.dart';
import 'package:dangdiarysample/pages/notification_page.dart';
import 'package:dangdiarysample/pages/onboarding.dart';
import 'package:dangdiarysample/pages/one_to_one_inquiry.dart';
import 'package:dangdiarysample/pages/posts.dart';
import 'package:dangdiarysample/pages/register_profile.dart';
import 'package:dangdiarysample/pages/report_detail.dart';
import 'package:dangdiarysample/pages/search_diary.dart';
import 'package:dangdiarysample/pages/search_posts.dart';
import 'package:dangdiarysample/pages/search_posts_result.dart';
import 'package:dangdiarysample/pages/sticker.dart';
import 'package:dangdiarysample/pages/sticker_detail.dart';
import 'package:dangdiarysample/pages/write_diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(
    nativeAppKey: 'b8dae3679aac82ab76c71988353705ad',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Platform.isAndroid
          ? Size(Get.width, Get.height)
          : Size(Get.width, Get.height),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Pretendard'),
          themeMode: ThemeMode.system,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ko', ''),
            Locale('en', ''),
          ],
          initialRoute: '/registerProfile',
          getPages: [
            GetPage(name: '/', page: () => Onboarding()),
            GetPage(name: '/app', page: () => App()),
            GetPage(name: '/challengeDetail', page: () => ChallengeDetail()),
            GetPage(name: '/writeDiary', page: () => WriteDiary()),
            GetPage(name: '/myPage', page: () => MyPage()),
            GetPage(name: '/posts', page: () => Posts()),
            GetPage(
                name: '/dogProfileSetting', page: () => DogProfileSetting()),
            GetPage(name: '/accountSetting', page: () => AccountSetting()),
            GetPage(name: '/allChallenge', page: () => AllChallenge()),
            GetPage(name: '/customerCenter', page: () => CustomerCenter()),
            GetPage(name: '/notice', page: () => Notice()),
            GetPage(name: '/reportDetail', page: () => ReportDetail()),
            GetPage(name: '/completeDiary', page: () => CompleteDiary()),
            GetPage(name: '/diary', page: () => Diary()),
            GetPage(name: '/diaries', page: () => Diaries()),
            GetPage(name: '/notificationPage', page: () => NotificationPage()),
            GetPage(name: '/searchDiary', page: () => SearchDiary()),
            GetPage(name: '/sticker', page: () => Sticker()),
            GetPage(name: '/stickerDetail', page: () => StickerDetail()),
            GetPage(name: '/searchPosts', page: () => SearchPosts()),
            GetPage(
                name: '/searchPostsResult', page: () => SearchPostsResult()),
            GetPage(name: '/appSetting', page: () => AppSetting()),
            GetPage(name: '/oneToOneInquiry', page: () => OneToOneInquiry()),
            GetPage(name: '/completeInquiry', page: () => CompleteInquiry()),
            GetPage(name: '/myInquiryHistory', page: () => MyInquiryHistory()),
            GetPage(
                name: '/myInquiryHistoryDetail',
                page: () => MyInquiryHistoryDetail()),
            GetPage(name: '/myReportHistory', page: () => MyReportHistory()),
            GetPage(
                name: '/myReportHistoryDetail',
                page: () => MyReportHistoryDetail()),
            GetPage(name: '/registerProfile', page: () => RegisterProfile()),
            GetPage(name: '/login', page: () => Login()),
          ],
        );
      },
    );
  }
}
