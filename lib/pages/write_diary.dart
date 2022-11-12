import 'dart:io';

import 'package:dangdiarysample/controllers/write_diary_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteDiary extends StatelessWidget {
  const WriteDiary({Key? key}) : super(key: key);

  void _showLaterWriteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          insetPadding: EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(24.0),
            width: double.infinity,
            height: 372,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.message, size: 24),
                    SizedBox(width: 8),
                    Text(
                      '일기를 다음에 쓰시겠어요?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '괜찮아요. 이번에 쓰지 않더라도, '),
                      TextSpan(
                        text: '일기장 탭> 밀린 일기 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                          text: '에서 언제든지 다시 도전할 수 있어요.\n지'
                              '이번에는 아쉽게 칭찬도장을 모으지 못했지만'
                              ', 다음에 밀린 일기를 쓰시면 받으실 수 있어요!'),
                    ],
                  ),
                ),
                SizedBox(height: 124),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xff7D7D7D),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        '알겠어요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '챌린지 목록으로 이동하고 싶어요',
                      style: TextStyle(
                        color: Color(0xff6B6B6B),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
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
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(WriteDiaryController());
    return _writeDiaryWidget(context);
  }

  Widget _writeDiaryWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              _showLaterWriteDialog(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(
            '일기쓰기',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 29.0),
              child: Container(
                width: 71,
                height: 32,
                decoration: BoxDecoration(
                  color: Color(0xffA6A6A6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    '일기제출',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 16),
                      Icon(Icons.golf_course),
                      SizedBox(width: 4),
                      Text(
                        '챌린지명',
                        style: TextStyle(
                          color: Color(0xff545454),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 29),
                      Text(
                        '한강공원 술래잡기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 132,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.calendar_month),
                          SizedBox(width: 4),
                          Text(
                            '도전 날짜',
                            style: TextStyle(
                              color: Color(0xff545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 24),
                          GestureDetector(
                            onTap: () {
                              WriteDiaryController.to.changeDate(context);
                            },
                            child: Obx(
                              () => Text(
                                WriteDiaryController.to.date.value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.fmd_good_outlined),
                          SizedBox(width: 4),
                          Text(
                            '장소',
                            style: TextStyle(
                              color: Color(0xff545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 52),
                          Text(
                            '캘리포니아 협재비치',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.sunny),
                          SizedBox(width: 4),
                          Text(
                            '날씨',
                            style: TextStyle(
                              color: Color(0xff545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 52),
                          Text(
                            '맑음',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 16),
                          Icon(Icons.control_point),
                          SizedBox(width: 4),
                          Text(
                            '아이 기분',
                            style: TextStyle(
                              color: Color(0xff545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 24),
                          Text(
                            '아주 좋았어요',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: '일기 제목을 작성해주세요',
                      hintStyle: TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.only(top: 7.5),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          Icons.book,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 8,
                        maxHeight: 7,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15.0),
                  color: Color(0xffD9D9D9),
                  child: GestureDetector(
                    onTap: () {
                      WriteDiaryController.to.pickImages();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Obx(
                        () => WriteDiaryController.to.images.isEmpty
                            ? _emptyImageList()
                            : _imageList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  child: TextField(
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: '일기 내용을 작성해주세요',
                      hintStyle: TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.only(top: 36.0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                          bottom: (15 - 1) * 19,
                        ),
                        child: Icon(
                          Icons.book,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emptyImageList() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 10),
          Text(
            '인증 사진을 올려주세요 (최대 3장)',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: WriteDiaryController.to.images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(
                  File(WriteDiaryController.to.images[index].path),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
