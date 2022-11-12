import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String postContent =
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 '
        '한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 한강공원 술래잡기 ';
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
            size: 32,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          '둘러보기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 11),
                Container(
                  width: double.infinity,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '오또캐드',
                        style: TextStyle(
                          color: Color(0xff1D1D1D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '초코',
                        style: TextStyle(
                          color: Color(0xff1D1D1D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.male, size: 10),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Text(
                        '초코와 술래잡기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '서울 성북구 유니크원 카페',
                        style: TextStyle(
                          color: Color(0xff7E7E7E),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2022년 9월 11일 월요일',
                            style: TextStyle(
                              color: Color(0xff1D1D1D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.wb_sunny_outlined, size: 16),
                              SizedBox(width: 8),
                              Icon(Icons.sentiment_very_satisfied_sharp,
                                  size: 16),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 380,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 207,
                            child: Container(
                              width: 100,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Icon(Icons.golf_course, size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    '애견카페 방문기 작성하기',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 96,
                            child: Container(
                              width: 100,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.heart_broken, size: 18),
                                  Text(
                                    '119',
                                    style: TextStyle(
                                      color: Color(0xff1D1D1D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        postContent,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 53),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
