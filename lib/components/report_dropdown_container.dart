import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeDropdown extends StatefulWidget {
  NoticeDropdown({
    Key? key,
    required this.title,
    required this.registerDate,
    required this.content,
  }) : super(key: key);

  String title;
  String registerDate;
  String content;

  @override
  _NoticeDropdownState createState() => _NoticeDropdownState();
}

class _NoticeDropdownState extends State<NoticeDropdown> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(24.w, 12.h, 28.w, 12.h),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: widget.title,
                            color: isOpened
                                ? Color(0xff6C8FDF)
                                : Color(0xff272727),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14),
                          ),
                          CustomText(
                            text: widget.registerDate,
                            color: Color(0xff696969),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Padding(
                      padding: EdgeInsets.only(right: 3.0.w),
                      child: AnimatedRotation(
                        duration: Duration(milliseconds: 200),
                        turns: isOpened ? 0.5 : 0,
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 16.r,
                          color: Color(0xff696969),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            child: Container(
              width: double.infinity,
              color: Color(0xffF5F5F5),
              child: isOpened
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 24.h),
                      child: CustomText(
                        text: widget.content,
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 14),
                      ),
                    )
                  : Container(),
            ),
          ),
          isOpened
              ? Container()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  width: double.infinity,
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(0.5.r),
                  ),
                ),
        ],
      ),
    );
  }
}
