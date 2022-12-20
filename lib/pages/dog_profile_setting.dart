import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DogProfileSetting extends StatelessWidget {
  const DogProfileSetting({Key? key}) : super(key: key);

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
        title: Text(
          '견적사항 관리',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Stack(
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.r),
                            image: DecorationImage(
                              image: AssetImage('assets/dog.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF4AD44),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 12.r,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '견적 사항',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 57,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '이름',
                                style: TextStyle(
                                  color: Color(0xff545454),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 11.w),
                        Expanded(
                          flex: 243,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '초코',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 57,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '견종',
                                style: TextStyle(
                                  color: Color(0xff545454),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 11.w),
                        Expanded(
                          flex: 243,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '웰시코기',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 57,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '성별',
                                style: TextStyle(
                                  color: Color(0xff545454),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 11.w),
                        Expanded(
                          flex: 243,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Icon(Icons.male, size: 10.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 57,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '생일',
                                style: TextStyle(
                                  color: Color(0xff545454),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 11.w),
                        Expanded(
                          flex: 243,
                          child: Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                '2000/00/00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xff7D7D7D),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    '이렇게 바꿀래요!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
