import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/report_dropdown_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportDetail extends StatelessWidget {
  const ReportDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
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
        title: CustomText(
          text: '신고내역',
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: (32 / 16),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: Icon(
              Icons.camera,
              size: 21.r,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: CustomText(
                text: '오또캐드님의 신고내역',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: (24 / 14),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return NoticeDropdown(
                    title: '[공지] 이용 중 학대가 의심되는 일기를 발견하면 신고바랍니다!',
                    registerDate: '2023.01.17',
                    content: '안녕하세요, 댕댕일기에요.\n'
                        '서비스 이용 중 학대가 의심되는 일기를 발견하시면 지체없이 신고하기 버튼을 눌러주세요!\n'
                        '신고하신 일기는 운영진이 꼼꼼히 검토하여 내부 규정에 따라 해당 유저에게 조치를 취하도록 하겠습니다.\n'
                        '클린하고 즐거운 댕댕일기를 함께 만들어 가요!\n'
                        '감사합니다.',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
