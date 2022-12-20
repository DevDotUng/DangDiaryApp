import 'dart:io';

import 'package:dangdiarysample/pages/account_setting.dart';
import 'package:dangdiarysample/pages/all_challenge.dart';
import 'package:dangdiarysample/pages/challenge_detail.dart';
import 'package:dangdiarysample/app.dart';
import 'package:dangdiarysample/pages/customer_center.dart';
import 'package:dangdiarysample/pages/dog_profile_setting.dart';
import 'package:dangdiarysample/pages/my_page.dart';
import 'package:dangdiarysample/pages/notice.dart';
import 'package:dangdiarysample/pages/post.dart';
import 'package:dangdiarysample/pages/report_detail.dart';
import 'package:dangdiarysample/pages/write_diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Platform.isAndroid ? Size(360, 740) : Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Pretendard'),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => App()),
            GetPage(name: '/challengeDetail', page: () => ChallengeDetail()),
            GetPage(name: '/writeDiary', page: () => WriteDiary()),
            GetPage(name: '/myPage', page: () => MyPage()),
            GetPage(name: '/post', page: () => Post()),
            GetPage(
                name: '/dogProfileSetting', page: () => DogProfileSetting()),
            GetPage(name: '/accountSetting', page: () => AccountSetting()),
            GetPage(name: '/allChallenge', page: () => AllChallenge()),
            GetPage(name: '/customerCenter', page: () => CustomerCenter()),
            GetPage(name: '/notice', page: () => Notice()),
            GetPage(name: '/reportDetail', page: () => ReportDetail()),
          ],
        );
      },
    );
  }
}
