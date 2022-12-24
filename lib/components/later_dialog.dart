import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  List _checkBoxBoolList = [true, false, false, false, false];

  void _showSubmitDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.all(24.0.r),
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
                    Icon(Icons.message, size: 24.r),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '이유를 제출했어요!',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20).h,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14).h,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '보호자님의 의견을 잘 참고해서 초고에게 딱 맞는'
                              '챌린지를 추천할 수 있도록 노력할게요.\n'
                              '해당 챌린지는 '),
                      TextSpan(
                        text: '리워드 탭> 전체 챌린지 목록',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                      ),
                      TextSpan(text: '에서 언제든지 다시 도전할 수 있어요.'),
                    ],
                  ),
                ),
                SizedBox(height: 124.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Color(0xff7D7D7D),
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
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Get.offAndToNamed('/allChallenge');
                      },
                      child: CustomText(
                        text: '챌린지 목록으로 이동하고 싶어요',
                        color: Color(0xff6B6B6B),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: (20 / 12).h,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      insetPadding: EdgeInsets.all(24.0.r),
      child: Container(
        padding: EdgeInsets.all(24.0.r),
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
                CustomText(
                  text: '혹시 아이가 좋아하지 않나요?',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: (24 / 20).h,
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '보호자님이 이 챌린지를 미루시는 이유가 궁금해요.\n'
                      '답변해주시면 다음엔 더 좋은 챌린지를 추천드릴게요.',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14).h,
                ),
                SizedBox(height: 114.h),
                ..._checkBoxList(),
              ],
            ),
            SizedBox(height: 50.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                _showSubmitDialog();
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xff7D7D7D),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Center(
                  child: CustomText(
                    text: '이런 이유에요',
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
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(0, '아이가 흥미를 보이지 않아요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(1, '아이가 체력적으로 힘들어해요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(2, '챌린지에 필요한 준비물이 없어요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(3, '그냥 나중에 하고 싶어요.'),
      ),
      _checkBox(4, '기타 이유'),
    ];
  }

  Widget _checkBox(int index, String content) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checkBoxBoolList[index] = !_checkBoxBoolList[index];
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _checkBoxBoolList[index]
              ? Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.all(
                      color: Color(0xff7D7D7D),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Color(0xff7D7D7D),
                        borderRadius: BorderRadius.circular(6.0.r),
                        border: Border.all(
                          color: Color(0xff7D7D7D),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.all(
                      color: Color(0xffA6A6A6),
                    ),
                  ),
                ),
          SizedBox(width: 8.w),
          CustomText(
            text: content,
            color: Color(0xff222222),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16).h,
          ),
        ],
      ),
    );
  }
}
