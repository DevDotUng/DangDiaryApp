import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaterDialog extends StatefulWidget {
  LaterDialog({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  Function onClose;

  @override
  _LaterDialogState createState() => _LaterDialogState();
}

class _LaterDialogState extends State<LaterDialog> {
  int currentIndex = 0;
  List<String> reasonContents = [
    '아이가 흥미를 보이지 않아요.',
    '아이가 체력적으로 힘들어해요.',
    '챌린지에 필요한 준비물이 없어요.',
    '기타 이유',
  ];

  void _showSubmitDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StaticIcon(
                      IconsPath.message,
                      size: 24.r,
                      color: StaticColor.font_main,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '이유를 제출했어요!',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '보호자님의 답변을 참고하여 딱 맞는 챌린지를 추천할 수 있도록 노력할게요.',
                  color: StaticColor.icon,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illusts/overdue_diary.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: StaticColor.main,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '알겠어요',
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      insetPadding: EdgeInsets.all(24.0.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StaticIcon(
                      IconsPath.caution,
                      size: 30.w,
                      color: StaticColor.font_main,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '정말 그만두시겠어요?',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: '이 챌린지를 미루시는 이유가 궁금해요.\n'
                      '답변해주시면 다음엔 더 좋은 챌린지를 추천드릴게요.',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illusts/sample.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                ..._checkBoxList(),
              ],
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                widget.onClose(reasonContents[currentIndex]);
                _showSubmitDialog();
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: StaticColor.main,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Center(
                  child: CustomText(
                    text: '제출할게요',
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
    );
  }

  List _checkBoxList() {
    return List.generate(
      4,
      (index) => Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: _checkBox(index, reasonContents[index]),
      ),
    );
  }

  Widget _checkBox(int index, String content) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentIndex == index
              ? Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.all(
                      color: StaticColor.link,
                      width: 1.5.w,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(6.0.r),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.all(
                      color: StaticColor.line,
                    ),
                  ),
                ),
          SizedBox(width: 8.w),
          CustomText(
            text: content,
            color: Color(0xff222222),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ],
      ),
    );
  }
}
