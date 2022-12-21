import 'package:dangdiarysample/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDropdownContainer extends StatefulWidget {
  const ReportDropdownContainer({Key? key}) : super(key: key);

  @override
  _ReportDropdownContainerState createState() =>
      _ReportDropdownContainerState();
}

class _ReportDropdownContainerState extends State<ReportDropdownContainer> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 24.w, top: 8.h, right: 24.w, bottom: 8.h),
        padding: EdgeInsets.all(8.0.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  height: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: Color(0xff00C2FF),
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      text: '접수중',
                      color: Color(0xff00C2FF),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  '2022/00/00',
                  style: TextStyle(
                    color: Color(0xffB8B8B8),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '00000으로 사용자 000님을 신고했어요.',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (16 / 14).h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.0.w),
                  child: AnimatedRotation(
                    duration: Duration(milliseconds: 200),
                    turns: isOpened ? 0.5 : 0,
                    child: Icon(Icons.keyboard_arrow_down_sharp, size: 24.r),
                  ),
                )
              ],
            ),
            isOpened
                ? Container(
                    margin: EdgeInsets.only(
                        left: 12.w, top: 27.h, right: 14.w, bottom: 17.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(11.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 4.0.h,
                              left: 14.w,
                              right: 14.w,
                              bottom: 16.h),
                          child: Container(
                            width: double.infinity,
                            height: 54.h,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 27.h,
                                  left: 0,
                                  right: 0,
                                  child: _dottedLine(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 54.w,
                                      height: 54.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius:
                                            BorderRadius.circular(27.r),
                                        border: Border.all(
                                          color: Color(0xff00C2FF),
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 54.w,
                                      height: 54.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius:
                                            BorderRadius.circular(27.r),
                                      ),
                                    ),
                                    Container(
                                      width: 54.w,
                                      height: 54.h,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius:
                                            BorderRadius.circular(27.r),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomText(
                          text:
                              'NN님의 신고가 정상적으로 접수되었어요.\n신고내용을 확인한 뒤 조치여부를 확인할게요.',
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: (16 / 12).h,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _dottedLine() {
    return Row(
      children: List.generate(
        150 ~/ 1,
        (index) => Expanded(
          child: Container(
            color: index % 3 == 0 ? Colors.transparent : Colors.grey,
            height: 1,
          ),
        ),
      ),
    );
  }
}
