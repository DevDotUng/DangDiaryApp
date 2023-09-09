import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 8.w),
      child: StaticIcon(
        IconsPath.back_arrow_bold,
        size: 24.r,
        color: const Color(0xff202020),
      ),
    );
  }
}
