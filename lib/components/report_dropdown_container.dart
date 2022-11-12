import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.only(left: 24, top: 8, right: 24, bottom: 8),
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff00C2FF),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '접수중',
                      style: TextStyle(
                        color: Color(0xff00C2FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '2022/00/00',
                  style: TextStyle(
                    color: Color(0xffB8B8B8),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '00000으로 사용자 000님을 신고했어요.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: AnimatedRotation(
                    duration: Duration(milliseconds: 200),
                    turns: isOpened ? 0.5 : 0,
                    child: Icon(Icons.keyboard_arrow_down_sharp, size: 24),
                  ),
                )
              ],
            ),
            isOpened
                ? Container(
                    margin: const EdgeInsets.only(
                        left: 12, top: 27, right: 14, bottom: 17),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    width: double.infinity,
                    height: 146,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(11),
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
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 14, right: 14, bottom: 16),
                          child: Container(
                            width: double.infinity,
                            height: 54,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 27,
                                  left: 0,
                                  right: 0,
                                  child: _dottedLine(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius: BorderRadius.circular(27),
                                        border: Border.all(
                                          color: Color(0xff00C2FF),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius: BorderRadius.circular(27),
                                      ),
                                    ),
                                    Container(
                                      width: 54,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: Color(0xffD2D2D2),
                                        borderRadius: BorderRadius.circular(27),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'NN님의 신고가 정상적으로 접수되었어요.\n신고내용을 확인한 뒤 조치여부를 확인할게요.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
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
