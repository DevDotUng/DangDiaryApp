import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.value,
    required this.onColor,
    required this.offColor,
  }) : super(key: key);

  bool value;
  Color onColor;
  Color offColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Color(0xffD9D9D9),
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            top: 2.h,
            bottom: 3.h,
            left: value ? 16.w : 34.w,
            duration: Duration(milliseconds: 200),
            child: CustomText(
              text: value ? 'ON' : 'OFF',
              color: value ? onColor : offColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: (24 / 14),
            ),
          ),
          AnimatedPositioned(
            top: 3.h,
            bottom: 3.h,
            left: value ? 43.w : 4.w,
            duration: Duration(milliseconds: 200),
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: value ? onColor : offColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
