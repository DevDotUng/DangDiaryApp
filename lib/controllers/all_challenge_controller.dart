import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChallengeController extends GetxController {
  late BuildContext context;
  AllChallengeController({required this.context});

  static AllChallengeController get to => Get.find();
  RxList<String> categoryList = ['전체', '산책', '간식', '여행', '훈련', '장난감'].obs;
  RxInt selectedCategory = 0.obs;
  RxBool isSearch = false.obs;
  RxList overduedDiarys = [].obs;

  @override
  void onReady() {
    _showDoneDialog(context);
    super.onReady();
  }

  void changeCategory(int index) {
    selectedCategory(index);
  }

  void search() {
    isSearch(true);
  }

  RxBool isFolded = true.obs;
  void fold(bool folded) {
    isFolded(folded);
  }

  void _showDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          insetPadding: EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 26.0),
            width: double.infinity,
            height: 396,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '앗!\n예전에 미룬 챌린지가 있어요',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.clear, size: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Obx(
                    () => isFolded.value
                        ? _twoOverduedChallenge()
                        : _overduedChallengeList(),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xff7D7D7D),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '일주일 뒤에 다시 알려주세요',
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _twoOverduedChallenge() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 26, right: 26),
      child: Column(
        children: [
          ...List.generate(
            2,
            (index) => _overduedChallengeWidget(0, 8, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              fold(!isFolded.value);
            },
            child: Container(
              width: double.infinity,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: Color(0xff00C2FF),
                  ),
                  Text(
                    '8개',
                    style: TextStyle(
                      color: Color(0xff00C2FF),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _overduedChallengeList() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _overduedChallengeWidget(4, 4, 26, 26);
        },
      ),
    );
  }

  Widget _overduedChallengeWidget(double topMargin, double bottomMargin,
      double leftMargin, double rightMargin) {
    return Container(
      margin: EdgeInsets.only(
          top: topMargin,
          bottom: bottomMargin,
          left: leftMargin,
          right: rightMargin),
      width: double.infinity,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              image: DecorationImage(
                image: AssetImage('assets/dog.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '한강공원 술래잡기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: Get.width - 203,
                  child: Text(
                    '한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기',
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
