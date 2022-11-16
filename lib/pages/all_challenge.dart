import 'package:dangdiarysample/controllers/all_challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChallenge extends StatelessWidget {
  const AllChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AllChallengeController(context: context));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            '모든 챌린지 리스트',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.white,
          child: Column(
            children: [
              Obx(
                () => AllChallengeController.to.overduedDiarys.length == 0
                    ? Container()
                    : _overduedDiary(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.padding, size: 24),
                      SizedBox(width: 4),
                      Text(
                        '모든 챌린지 리스트',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      AllChallengeController.to.search();
                    },
                    child: Icon(Icons.search, size: 24),
                  ),
                ],
              ),
              Obx(() => _searchBar()),
              Divider(color: Color(0xffEBEBEB), thickness: 1),
              Container(
                width: double.infinity,
                height: 24,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AllChallengeController.to.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.5),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            AllChallengeController.to.changeCategory(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            height: 24,
                            decoration: BoxDecoration(
                              color: index ==
                                      AllChallengeController
                                          .to.selectedCategory.value
                                  ? Color(0xffA6A6A6)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                AllChallengeController.to.categoryList[index],
                                style: TextStyle(
                                  color: index ==
                                          AllChallengeController
                                              .to.selectedCategory.value
                                      ? Colors.white
                                      : Color(0xffB6B6B6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(color: Color(0xffEBEBEB), thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xff7D7D7D7),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '미달성 챌린지만 볼래요',
                    style: TextStyle(
                      color: Color(0xff7D7D7D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 174,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/post');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/dog.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '챌린지 이름 챌린지\n이름 챌린지',
                            style: TextStyle(
                              color: Color(0xff7D7D7D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return AllChallengeController.to.isSearch.value
        ? Column(
            children: [
              SizedBox(height: 8),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  cursorColor: Color(0xff202020),
                  cursorWidth: 1,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xff0A0A0A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: '어떤 챌린지를 찾아볼까요?',
                    hintStyle: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.only(left: 8.0),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 0.0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }

  Widget _overduedDiary() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.collections_bookmark, size: 24),
            SizedBox(width: 4),
            Text(
              '밀린 일기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4),
            Text(
              '3',
              style: TextStyle(
                color: Color(0xffFF9900),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          height: 104,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 4, right: 16),
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: 310,
                  height: 104,
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
                      Container(
                        width: 87,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage('assets/dog.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
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
                          Text(
                            '2022.09.01에 했어요',
                            style: TextStyle(
                              color: Color(0xff7D7D7D),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '임시 저장된 일기쓰기 ',
                                    style: TextStyle(
                                      color: Color(0xff7D7D7D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '30%',
                                    style: TextStyle(
                                      color: Color(0xffFF9900),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Stack(
                                children: [
                                  Container(
                                    width: 190,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      width: 190 / 100 * 30,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFF9900),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 32),
      ],
    );
  }
}
