import 'dart:convert';
import 'dart:io';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/login_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart';

class Login extends StatelessWidget {
  Login({Key? key, this.firebaseToken}) : super(key: key);

  String? firebaseToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/login_background.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.white.withOpacity(0)],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 133.h,
                    left: 36.w,
                    child: CustomText(
                      text: '댕댕일기와 함께\n특별한 추억을 만들어보세요',
                      color: StaticColor.font_main,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      height: (40 / 24),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            CustomText(
              text: '간편로그인으로 3초만에 시작하기 🚀',
              color: StaticColor.icon,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              height: (20 / 12),
            ),
            SizedBox(height: 14.h),
            GestureDetector(
              onTap: () => LoginRepository().appleLogin(firebaseToken),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 36.w),
                width: double.infinity,
                height: 48.r,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15.r,
                        height: 19.r,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/apple_logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 9.w),
                      Text(
                        'Apple로 계속하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () => LoginRepository().kakaoLogin(firebaseToken),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 36.w),
                width: double.infinity,
                height: 48.r,
                decoration: BoxDecoration(
                  color: Color(0xffFEE500),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StaticIcon(
                      IconsPath.kakao_logo,
                      size: 17.r,
                      color: Colors.black,
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      '카카오톡으로 로그인',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.85),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }
}
