import 'package:dangdiarysample/components/later_dialog.dart';
import 'package:dangdiarysample/controllers/challenge_detail_controller.dart';
import 'package:dangdiarysample/skeletons/challenge_detail_skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeDetail extends StatelessWidget {
  const ChallengeDetail({Key? key}) : super(key: key);

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
            padding: EdgeInsets.all(24.0),
            width: double.infinity,
            height: 395,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '잘했어요!\n이제 일기를 쓰러 가볼까요?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(65.0),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '일기를 쓰면 이 칭찬스티커를 받을 수 있어요!',
                  style: TextStyle(
                    color: Color(0xff7D7D7D),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 29),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Get.toNamed('/writeDiary');
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xff7D7D7D),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        '일기를 쓰러 갈래요',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '일기는 다음에 쓸게요',
                  style: TextStyle(
                    color: Color(0xff6B6B6B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLaterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LaterDialog(onClose: () {
          ChallengeDetailController.to.setIsChallenge(false);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ChallengeDetailController());
    return Obx(
      () => ChallengeDetailController.to.isLoading.value
          ? ChallengeDetailSkeleton()
          : _challengeDetailWidget(context),
    );
  }

  Widget _challengeDetailWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          controller: ChallengeDetailController.to.scrollController,
          slivers: [
            SliverAppBar(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Obx(
                  () => Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: ChallengeDetailController.to.scrollPosition > 150
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              pinned: true,
              expandedHeight: 228,
              primary: true,
              flexibleSpace: Stack(
                children: [
                  FlexibleSpaceBar(
                    background: SizedBox(
                      height: Get.width,
                      width: Get.width,
                      child: Image.asset(
                        'assets/dog.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black38, Colors.transparent],
                            stops: [0.0, 0.15],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Obx(
                      () => AnimatedOpacity(
                        opacity:
                            ChallengeDetailController.to.scrollPosition > 150
                                ? 0
                                : 1,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      '한강공원 술래잡기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '총 00회 진행',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: 2,
                                height: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '총 00회 진행',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 104,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '챌린지 공유',
                                  style: TextStyle(
                                    color: Colors.white,
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
                    SizedBox(height: 24),
                    AnimatedSize(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: Obx(
                        () => Text(
                          ChallengeDetailController.to.challengeContent,
                          maxLines: ChallengeDetailController.to.isMore.value
                              ? 10
                              : 4,
                          style: TextStyle(
                            color: Color(0xff7D7D7D),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ChallengeDetailController.to.changeIsMore();
                          },
                          child: Row(
                            children: [
                              Obx(
                                () => AnimatedRotation(
                                  duration: Duration(milliseconds: 500),
                                  turns:
                                      ChallengeDetailController.to.isMore.value
                                          ? 0.5
                                          : 0.0,
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Text(
                                '더보기',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      width: 327,
                      height: 116,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffA6A6A6),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '인증 방법',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.rocket_launch_sharp,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Container(
                                width: Get.width - 102,
                                child: Text(
                                  '인증 방법 설명 인증 방법 설명 인증 방법 설명 인증 방법 설명 인증 방법 설명 인증 방법 설명 인증 방법 설명 인증 방법 설명',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '다른 아이들은 이렇게 했어요!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.menu),
                      ],
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: 104,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/post");
                              },
                              child: Container(
                                width: 104,
                                height: 104,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 49),
                    Obx(
                      () => ChallengeDetailController.to.isChallenge.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      _showLaterDialog(context);
                                    },
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Color(0xffA6A6A6),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '다음에 다시 할게요',
                                          style: TextStyle(
                                            color: Color(0xffA6A6A6),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      _showDoneDialog(context);
                                    },
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xff7D7D7D),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '다했어요!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : GestureDetector(
                              onTap: () {
                                ChallengeDetailController.to
                                    .setIsChallenge(true);
                              },
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Color(0xff7D7D7D),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    '도전할래요',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
