import 'dart:io';

import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/pages/account_delete.dart';
import 'package:dangdiarysample/pages/account_setting.dart';
import 'package:dangdiarysample/pages/all_challenge.dart';
import 'package:dangdiarysample/pages/app_setting.dart';
import 'package:dangdiarysample/pages/challenge_detail.dart';
import 'package:dangdiarysample/app.dart';
import 'package:dangdiarysample/pages/complete_diary.dart';
import 'package:dangdiarysample/pages/complete_inquiry.dart';
import 'package:dangdiarysample/pages/confirm_diary.dart';
import 'package:dangdiarysample/pages/customer_center.dart';
import 'package:dangdiarysample/pages/diaries.dart';
import 'package:dangdiarysample/pages/diary.dart';
import 'package:dangdiarysample/pages/dog_profile_setting.dart';
import 'package:dangdiarysample/pages/faq.dart';
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
import 'package:dangdiarysample/pages/splash.dart';
import 'package:dangdiarysample/pages/sticker.dart';
import 'package:dangdiarysample/pages/sticker_detail.dart';
import 'package:dangdiarysample/pages/terms_of_service.dart';
import 'package:dangdiarysample/pages/webview.dart';
import 'package:dangdiarysample/pages/write_diary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  KakaoSdk.init(
    nativeAppKey: 'b8dae3679aac82ab76c71988353705ad',
  );
  await Hive.initFlutter();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // notification 설정
  String? firebaseToken = await fcmSetting();

  runApp(MyApp(firebaseToken: firebaseToken));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
}

Future<String?> fcmSetting() async {
  // firebase core 기능 사용을 위한 필수 initializing
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  // foreground에서의 푸시 알림 표시를 위한 알림 중요도 설정 (안드로이드)
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'somain_notification', 'somain_notification',
      description: '소마인 알림입니다.', importance: Importance.max);

  // foreground 에서의 푸시 알림 표시를 위한 local notifications 설정
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // foreground 푸시 알림 핸들링
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ));

      print('Message also contained a notification: ${message.notification}');
    }
  });

  // firebase token 발급
  String? firebaseToken = await messaging.getToken();

  print("firebaseToken : ${firebaseToken}");

  return firebaseToken;
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.firebaseToken}) : super(key: key);

  String? firebaseToken;

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
          initialRoute: '/splash',
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
            GetPage(
                name: '/searchPosts',
                page: () => SearchPosts(autoCompleteWords: [])),
            GetPage(
                name: '/searchPostsResult',
                page: () => SearchPostsResult(query: '')),
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
            GetPage(
                name: '/login',
                page: () => Login(firebaseToken: firebaseToken)),
            GetPage(
                name: '/splash',
                page: () => Splash(
                      firebaseToken: firebaseToken,
                    )),
            GetPage(name: '/termsOfService', page: () => TermsOfService()),
            GetPage(name: '/faq', page: () => FAQ()),
            GetPage(name: '/accountDelete', page: () => AccountDelete()),
            GetPage(name: '/webviewPage', page: () => WebviewPage()),
            // GetPage(name: '/confirmDiary', page: () => ConfirmDiary()),
          ],
        );
      },
    );
  }
}
