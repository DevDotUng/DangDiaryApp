import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(),
        title: CustomText(
          text: '마이페이지',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 89.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 20.w, top: 37.h, right: 20.w),
                      width: double.infinity,
                      height: 111.h,
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(11.07.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu, size: 16.r),
                                    SizedBox(width: 8.w),
                                    CustomText(
                                      text: '나의 일기 000장',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      height: (20 / 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu, size: 16.r),
                                    SizedBox(width: 8.w),
                                    CustomText(
                                      text: '시작한지 000일',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                      height: (20 / 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu, size: 16.r),
                                    SizedBox(width: 8.w),
                                    CustomText(
                                      text: '받은 좋아요 00개',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu, size: 16.r),
                                    SizedBox(width: 8.w),
                                    CustomText(
                                      text: '받은 도장 00개',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 101.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.07.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, top: 19.h, bottom: 26.h),
                        child: Row(
                          children: [
                            Container(
                              width: 56.w,
                              height: 56.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28.0.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage('assets/dog.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 14.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Get.width - 134.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '오또캐드',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        '님과',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '초코',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Get.width - 134.w,
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: '웰시코기',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (20 / 12),
                                      ),
                                      SizedBox(width: 3.w),
                                      Icon(Icons.male, size: 8.r),
                                      SizedBox(width: 16.w),
                                      CustomText(
                                        text: '8살',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (20 / 12),
                                      ),
                                      SizedBox(width: 16.w),
                                      CustomText(
                                        text: '2000-00-00',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (20 / 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Icon(Icons.menu, size: 16.r),
                SizedBox(width: 8.w),
                CustomText(
                  text: '계정 관리',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: (20 / 14),
                ),
              ],
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              thickness: 1.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/dogProfileSetting');
                },
                child: Row(
                  children: [
                    CustomText(
                      text: '견적사항 관리',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.transparent)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/accountSetting');
                },
                child: Row(
                  children: [
                    CustomText(
                      text: '계정 관리',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.transparent)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                  ],
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Row(
              children: [
                Icon(Icons.menu, size: 16.r),
                SizedBox(width: 8.w),
                CustomText(
                  text: '앱 관리',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: (20 / 14),
                ),
              ],
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              thickness: 1.0.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '앱 설정',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 14),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/customerCenter');
                },
                child: Row(
                  children: [
                    CustomText(
                      text: '고객센터',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.transparent)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/reportDetail');
                },
                child: Row(
                  children: [
                    CustomText(
                      text: '신고내역',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    Expanded(
                        child:
                            Container(height: 20, color: Colors.transparent)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Text(
                  'asdkjhluwhdlj aslkjdoiqw\nver 0.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffDDDDDD),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: (20 / 12).h,
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
