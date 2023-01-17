import 'dart:ui';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StickerDetail extends StatelessWidget {
  const StickerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 32.r,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: '칭찬 스티커',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Stack(
                children: [
                  Container(
                    width: 154.w,
                    height: 154.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(77.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(0, 4.h),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: Color(0xff7B61FF),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'X4',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: '눈밭에서 백덤블링하기',
                color: Color(0xff7B61FF),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                height: (28 / 20),
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: '첫 획득 일자 2022.03.09',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: (24 / 16),
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: '최근 획득 일자  2022.05.05',
                color: Color(0xff7D7D7D),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: (20 / 14),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                height: 8.h,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  SizedBox(width: 24.w),
                  CustomText(
                    text: '해당 챌린지 일기',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    height: (24 / 16),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: AssetImage('assets/dog.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 16.w),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xffB6CAFF),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '12월 25일',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '전기담요에서 간식먹기',
                                  style: TextStyle(
                                    color: Color(0xff222222),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(child: Container()),
                                Icon(
                                  Icons.favorite,
                                  size: 16.r,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 18.w),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                              ],
                            ),
                          ),
                        ),
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
}
