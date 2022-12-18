import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/home_controller.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(
      () => HomeController.to.isLoading.value ? HomeSkeleton() : _homeWidget(),
    );
  }

  Widget _homeWidget() {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => Image.asset(
                    HomeController
                        .to.imageList[HomeController.to.mainIndex.toInt()],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.20),
            ],
          ),
          Positioned(
            top: 90,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘은 초코가',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '한강공원 산책을 가고\n싶어해요!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            right: 24,
            child: GestureDetector(
              onTap: () {
                BottomNavController.to.changeBottomNav(3);
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-0.1, -0.1),
                      blurRadius: 4.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0.1, 0.1),
                      blurRadius: 4.0,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/dog.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.3 + 32,
            left: 24,
            child: Container(
              width: 49,
              height: 209,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Obx(
                () => PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: HomeController.to.pageController,
                  itemCount: HomeController.to.imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 37,
                      child: Center(
                        child: Obx(
                          () => Text(
                            '${index + 1}',
                            style: TextStyle(
                              color:
                                  index == HomeController.to.mainIndex.toInt()
                                      ? Colors.white
                                      : Colors.grey,
                              fontSize:
                                  index == HomeController.to.mainIndex.toInt()
                                      ? 24
                                      : 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          _customBottomSheet(),
        ],
      ),
    );
  }

  Widget _customBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 4),
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      ...List.generate(
                        10,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 24.0, bottom: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.rocket),
                                    SizedBox(height: 4),
                                    Text(
                                      '진행 중인 챌린지',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '현재 효림님이 초코와 진행 중인 챌린지에요',
                                  style: TextStyle(
                                    color: Color(0xff7D7D7D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 108,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed('/challengeDetail');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.1),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4,
                                                right: 17,
                                                top: 4,
                                                bottom: 4),
                                            child: Center(
                                              child: Container(
                                                width: Get.width * 0.7,
                                                height: 108,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset:
                                                          Offset(-0.1, -0.1),
                                                      blurRadius: 4.0,
                                                    ),
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset: Offset(0.1, 0.1),
                                                      blurRadius: 4.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 12),
                                                    Container(
                                                      width: 87,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.0),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/dog.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 12.0,
                                                          horizontal: 8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '한강공원 술래잡기',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: Get.width *
                                                                    0.7 -
                                                                119,
                                                            child: Text(
                                                              '한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기한강공원 술래잡기',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff7D7D7D),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8.0, bottom: 24.0),
                        height: 4,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
