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
        title: Text(
          '마이페이지',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
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
                      padding: EdgeInsets.only(left: 20.w, top: 37.h),
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
                              Icon(Icons.menu, size: 16.r),
                              SizedBox(width: 8.w),
                              Text(
                                '나의 일기 000장',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 44.w),
                              Icon(Icons.menu, size: 16.r),
                              SizedBox(width: 8.w),
                              Text(
                                '시작한지 000일',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Icon(Icons.menu, size: 16.r),
                              SizedBox(width: 8.w),
                              Text(
                                '받은 좋아요 00개',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 44.w),
                              Icon(Icons.menu, size: 16.r),
                              SizedBox(width: 8.w),
                              Text(
                                '받은 도장 00개',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
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
                                      Text(
                                        '웰시코기',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Icon(Icons.male, size: 8.r),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '8살',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Text(
                                        '2000-00-00',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
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
                Text(
                  '계정 관리',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '견적사항 관리',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '계정 관리',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                Text(
                  '앱 관리',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
                  Text(
                    '앱 설정',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '고객센터',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '신고내역',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_outlined, size: 14.r),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'asdkjhluwhdlj aslkjdoiqw',
                      style: TextStyle(
                        color: Color(0xffDDDDDD),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'ver 0.0.0',
                      style: TextStyle(
                        color: Color(0xffDDDDDD),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
