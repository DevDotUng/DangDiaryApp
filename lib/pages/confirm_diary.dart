import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/pageview_indicator.dart';
import 'package:dangdiarysample/models/write_diary/complete_diary_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// class ConfirmDiary extends StatefulWidget {
//   ConfirmDiary({Key? key}) : super(key: key);
//
//   @override
//   State<ConfirmDiary> createState() => _ConfirmDiaryState();
// }
//
// class _ConfirmDiaryState extends State<ConfirmDiary> {
//   String postContent =
//       '나는 평소에 초코가 되게 얌전하고 게으른 줄 알았는데, 오늘 챌린지를 하면서 완전 오해라는 걸 깨달았다... 초코.. 보통이 아닌 댕댕이다... 얼마나 뛰는 걸 좋아하던지, 내가 먼저 지쳐 나가 떨어졌다!😭 그래도 초코가 활기차게 뛰어 노는 걸 보니 앞으로도 종종 이렇게 전력질주 하는 날을 만들어 줘야겠다는 생각이 들었다 :)';
//
//   CompleteDiaryModel _completeDiaryModel = Get.arguments['completeDiaryModel'];
//   // CompleteDiaryModel _completeDiaryModel = CompleteDiaryModel(
//   //   diaryId: 45,
//   //   userId: 7,
//   //   challengeId: 1,
//   //   title: '산책을 했어요!!',
//   //   endDate: '2023-03-29 19:01:35',
//   //   weather: '흐림',
//   //   feeling: '즐거워요',
//   //   content: '산책을 했는데 귀요미가 정말 귀여웠어용 ㅎ',
//   //   hit: 0,
//   //   isPublic: true,
//   //   images: [
//   //     '10156c2d-db17-4403-98a1-abd9b686d4e3image_picker_2A223148-29A2-4A2E-970D-D21B582206DE-5524-0000043188D2622E.jpg',
//   //     'caf7dd85-a70e-49a9-94b9-80ffa8de2632image_picker_6423E78F-AD93-4B89-9264-FD8565F8FFFE-5524-0000043188509BC4.jpg',
//   //     '10156c2d-db17-4403-98a1-abd9b686d4e3image_picker_2A223148-29A2-4A2E-970D-D21B582206DE-5524-0000043188D2622E.jpg',
//   //     'caf7dd85-a70e-49a9-94b9-80ffa8de2632image_picker_6423E78F-AD93-4B89-9264-FD8565F8FFFE-5524-0000043188509BC4.jpg',
//   //     '10156c2d-db17-4403-98a1-abd9b686d4e3image_picker_2A223148-29A2-4A2E-970D-D21B582206DE-5524-0000043188D2622E.jpg',
//   //     'caf7dd85-a70e-49a9-94b9-80ffa8de2632image_picker_6423E78F-AD93-4B89-9264-FD8565F8FFFE-5524-0000043188509BC4.jpg',
//   //   ],
//   //   tags: ['산책', '귀요미', '조아조아조아'],
//   //   dogName: '귀요미',
//   //   stickerImage: 'sticker.png',
//   //   stickerShape: 'circle',
//   // );
//   late PageController pageController;
//
//   @override
//   void initState() {
//     pageController = PageController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
//           child: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: StaticIcon(
//               IconsPath.back_arrow_bold,
//               size: 24.r,
//               color: StaticColor.font_main,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         padding:
//             EdgeInsets.only(left: 24.w, top: 12.h, right: 24.w, bottom: 38.h),
//         color: StaticColor.white,
//         child: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.fromLTRB(12.w, 24.h, 24.w, 32.h),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/diary_background.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 81.h),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _clipHole(),
//                         _clipHole(),
//                         _clipHole(),
//                         _clipHole(),
//                         _clipHole(),
//                         _clipHole(),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16.w),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Expanded(child: Container()),
//                             CustomText(
//                               text: _completeDiaryModel.title,
//                               color: Color(0xff222222),
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               height: (24 / 16),
//                             ),
//                             Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   StaticIcon(
//                                     _completeDiaryModel.isPublic
//                                         ? IconsPath.unlock
//                                         : IconsPath.lock,
//                                     size: 16.r,
//                                     color: StaticColor.icon,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 4.h),
//                         Container(
//                           width: double.infinity,
//                           height: 2.h,
//                           decoration: BoxDecoration(
//                             color: Color(0xffD9D9D9),
//                             borderRadius: BorderRadius.circular(1.r),
//                           ),
//                         ),
//                         SizedBox(height: 16.h),
//                         Row(
//                           children: [
//                             CustomText(
//                               text:
//                                   getFormattedDate(_completeDiaryModel.endDate),
//                               color: StaticColor.icon,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w500,
//                               height: (20 / 12),
//                             ),
//                             Expanded(child: Container()),
//                             CustomText(
//                               text: '날씨',
//                               color: StaticColor.link,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w500,
//                               height: (20 / 12),
//                             ),
//                             SizedBox(width: 4.w),
//                             StaticIcon(
//                               getWeather(_completeDiaryModel.weather),
//                               size: 16.r,
//                               color: Color(0xff202020),
//                             ),
//                             SizedBox(width: 8.w),
//                             CustomText(
//                               text: '기분',
//                               color: StaticColor.link,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w500,
//                               height: (20 / 12),
//                             ),
//                             SizedBox(width: 4.w),
//                             StaticIcon(
//                               getFeeling(_completeDiaryModel.feeling),
//                               size: 16.r,
//                               color: Color(0xff202020),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8.h),
//                         SizedBox(
//                           height: 215.h,
//                           child: Stack(
//                             children: [
//                               PageView.builder(
//                                 controller: pageController,
//                                 itemCount: _completeDiaryModel.images.length,
//                                 itemBuilder: (context, index) {
//                                   return Container(
//                                     width: double.infinity,
//                                     height: 215.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5.r),
//                                       image: DecorationImage(
//                                         image: NetworkImage(PublicRepository()
//                                             .getDiaryImageUrl(
//                                                 _completeDiaryModel
//                                                     .images[index])),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                               Positioned(
//                                 bottom: 16.h,
//                                 left: (Get.width - 120.w) / 2 - 28.w,
//                                 child: PageViewIndicator(
//                                   itemCount: _completeDiaryModel.images.length,
//                                   pageController: pageController,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 8.h),
//                         Row(
//                           children: [
//                             StaticIcon(
//                               IconsPath.like,
//                               size: 24.r,
//                               color: StaticColor.like,
//                             ),
//                             SizedBox(width: 4.w),
//                             CustomText(
//                               text: '0',
//                               color: StaticColor.icon,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w500,
//                               height: (14 / 12),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8.h),
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     text: _completeDiaryModel.content,
//                                     color: Color(0xff6B6B6B),
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w400,
//                                     height: (20 / 14),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 24.h),
//                         Container(
//                           height: 32.h,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: _completeDiaryModel.tags.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 margin: EdgeInsets.only(right: 4.w),
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 6.h, horizontal: 16.w),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(16.r),
//                                   border: Border.all(
//                                     color: StaticColor.line2,
//                                   ),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     CustomText(
//                                       text: '# ',
//                                       color: index == 0
//                                           ? StaticColor.main
//                                           : StaticColor.font_main,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     CustomText(
//                                       text: _completeDiaryModel.tags[index],
//                                       color: index == 0
//                                           ? StaticColor.main
//                                           : StaticColor.font_main,
//                                       fontSize: 14.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 3.h,
//               left: 28.w,
//               child: _completeDiaryModel.stickerShape == 'circle'
//                   ? Container(
//                       width: 40.w,
//                       height: 66.h,
//                       decoration: BoxDecoration(
//                         color: StaticColor.main_light,
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20.r),
//                           bottomRight: Radius.circular(20.r),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Expanded(child: Container()),
//                           Container(
//                             width: 32.w,
//                             height: 32.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(16.r),
//                               image: DecorationImage(
//                                 image: NetworkImage(PublicRepository()
//                                     .getStickerImageUrl(
//                                         _completeDiaryModel.stickerImage)),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 4.h),
//                         ],
//                       ),
//                     )
//                   : Container(
//                       width: 40.w,
//                       height: 66.h,
//                       decoration: BoxDecoration(
//                         color: StaticColor.main_light,
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(5.r),
//                           bottomRight: Radius.circular(5.r),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Expanded(child: Container()),
//                           Container(
//                             width: 32.w,
//                             height: 26.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(5.r),
//                               image: DecorationImage(
//                                 image: NetworkImage(PublicRepository()
//                                     .getStickerImageUrl(
//                                         _completeDiaryModel.stickerImage)),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 4.h),
//                         ],
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _clipHole() {
//     return Container(
//       width: 20.w,
//       height: 20.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//           ),
//           BoxShadow(
//             color: Colors.white,
//             blurRadius: 1.2.r,
//             spreadRadius: -1.2.r,
//           ),
//         ],
//       ),
//     );
//   }
//
//   String getFormattedDate(String date) {
//     DateTime dateTime = DateTime.parse(date);
//     String formattedDate = DateFormat('yyyy년 MM월 dd일 ').format(dateTime);
//     String dayOfWeek = DateFormat.E('ko_KR').format(dateTime);
//     String result = formattedDate + dayOfWeek + '요일';
//
//     return result;
//   }
//
//   String getFeeling(type) {
//     String feeling;
//     final map = {
//       '기뻐요': IconsPath.happy,
//       '즐거워요': IconsPath.fun,
//       '차분해요': IconsPath.happy,
//       '활기차요': IconsPath.full_energy,
//       '화나요': IconsPath.angry,
//       '짜증나요': IconsPath.annoying,
//       '두려워요': IconsPath.afraid,
//       '불안해요': IconsPath.nervous,
//       '모르겠어요': IconsPath.dont_know,
//     };
//     feeling = map[type] ?? IconsPath.happy;
//
//     return feeling;
//   }
//
//   String getWeather(type) {
//     String weather;
//     final map = {
//       '맑음': IconsPath.sunny_bold,
//       '흐림': IconsPath.cloudy_bold,
//       '비': IconsPath.rain_bold,
//       '눈': IconsPath.snow_bold,
//       '천둥번개': IconsPath.thunder_bold,
//       '안개': IconsPath.fog_bold,
//     };
//     weather = map[type] ?? IconsPath.sunny_bold;
//
//     return weather;
//   }
// }
