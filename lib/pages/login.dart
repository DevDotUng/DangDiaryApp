import 'dart:convert';
import 'dart:io';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/login_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 132.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 36.w),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      height: (40 / 24),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '댕댕일기',
                        style: TextStyle(
                          color: StaticColor.main,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          height: (40 / 24),
                        ),
                      ),
                      TextSpan(text: '와 함께\n특별한 추억을 만들어보세요'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.7.h),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18.7.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login_background.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 22.5.h),
          CustomText(
            text: '간편로그인으로 3초만에 시작하기 🚀',
            color: StaticColor.icon,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            height: (20 / 12),
          ),
          SizedBox(height: 23.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => LoginRepository().kakaoLogin(),
                child: Container(
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () => LoginRepository().appleLogin(),
                child: Container(
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 130.h),
        ],
      ),
    );
  }
}
