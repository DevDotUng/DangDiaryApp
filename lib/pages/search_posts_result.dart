import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/search_posts_result_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPostsResult extends StatefulWidget {
  SearchPostsResult({Key? key, required this.query}) : super(key: key);

  late String query;

  @override
  State<SearchPostsResult> createState() => _SearchPostsResultState();
}

class _SearchPostsResultState extends State<SearchPostsResult> {
  @override
  void dispose() {
    Get.delete<SearchPostsResultController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchPostsResultController(query: widget.query));
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 32.r,
              color: Colors.black,
            ),
          ),
          title: CustomText(
            text: '둘러보기 검색하기',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            height: (28 / 16),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
          color: Colors.white,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                width: double.infinity,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: SearchPostsResultController
                            .to.textEditingController,
                        cursorColor: Colors.black,
                        cursorWidth: 1.w,
                        cursorHeight: 20.h,
                        textInputAction: TextInputAction.search,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14).h,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12.h),
                          border: InputBorder.none,
                          hintText: '해시태그, 계정, 견종으로 검색해보세요.',
                          hintStyle: TextStyle(
                            color: Color(0xffA6A6A6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => SearchPostsResultController.to.searchText.isEmpty
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                SearchPostsResultController
                                    .to.textEditingController
                                    .clear();
                                SearchPostsResultController.to
                                    .searchTextClear();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Icon(
                                Icons.clear,
                                size: 14.r,
                                color: Color(0xff222222),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              _searchPostsResultTabBar(),
              SizedBox(height: 16.h),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanDown: (_) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Obx(
                    () => SearchPostsResultController
                                .to.searchPostsResultModel.value ==
                            null
                        ? Container()
                        : IndexedStack(
                            index: SearchPostsResultController
                                .to.tabBarIndex.value,
                            children: [
                              Visibility(
                                visible: SearchPostsResultController
                                        .to.tabBarIndex.value ==
                                    0,
                                child: _postsResultByHashTag(),
                              ),
                              Visibility(
                                visible: SearchPostsResultController
                                        .to.tabBarIndex.value ==
                                    1,
                                child: _postsResultByAccount(),
                              ),
                              Visibility(
                                visible: SearchPostsResultController
                                        .to.tabBarIndex.value ==
                                    2,
                                child: _postsResultByBreed(),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchPostsResultTabBar() {
    return Container(
      width: double.infinity,
      height: 46.h,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  SearchPostsResultController.to.changeTabBarIndex(0);
                },
                child: Container(
                  width: (Get.width - 48.w) / 3,
                  color: Colors.white,
                  child: Center(
                    child: Obx(
                      () => Text(
                        '해시태그',
                        style: TextStyle(
                          color: SearchPostsResultController
                                      .to.tabBarIndex.value ==
                                  0
                              ? StaticColor.main
                              : Color(0xff7D7D7D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: (20 / 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SearchPostsResultController.to.changeTabBarIndex(1);
                },
                child: Container(
                  width: (Get.width - 48.w) / 3,
                  color: Colors.white,
                  child: Center(
                    child: Obx(
                      () => Text(
                        '계정',
                        style: TextStyle(
                          color: SearchPostsResultController
                                      .to.tabBarIndex.value ==
                                  1
                              ? StaticColor.main
                              : Color(0xff7D7D7D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: (20 / 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SearchPostsResultController.to.changeTabBarIndex(2);
                },
                child: Container(
                  width: (Get.width - 48.w) / 3,
                  color: Colors.white,
                  child: Center(
                    child: Obx(
                      () => Text(
                        '견종',
                        style: TextStyle(
                          color: SearchPostsResultController
                                      .to.tabBarIndex.value ==
                                  2
                              ? StaticColor.main
                              : Color(0xff7D7D7D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: (20 / 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 2.h,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(1.r),
            ),
            child: Stack(
              children: [
                Obx(
                  () => AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    top: 0,
                    bottom: 0,
                    left: SearchPostsResultController.to
                        .getTabBarPosition(
                            SearchPostsResultController.to.tabBarIndex.value)
                        .w,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: (Get.width - 48.w) / 3,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postsResultByHashTag() {
    if (SearchPostsResultController
        .to.searchPostsResultModel.value!.hashTags.isEmpty) {
      return noResultWidget('해시태그가');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: SearchPostsResultController
            .to.searchPostsResultModel.value!.hashTags.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/posts', arguments: {
                  'query': SearchPostsResultController
                      .to.searchPostsResultModel.value!.hashTags[index],
                  'searchType': 'hashTag'
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text:
                          '#${SearchPostsResultController.to.searchPostsResultModel.value!.hashTags[index]}',
                      color: StaticColor.font_main,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget _postsResultByAccount() {
    if (SearchPostsResultController
        .to.searchPostsResultModel.value!.accounts.isEmpty) {
      return noResultWidget('계정이');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: SearchPostsResultController
            .to.searchPostsResultModel.value!.accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/posts', arguments: {
                  'searchType': 'account',
                  'dogName': SearchPostsResultController
                      .to.searchPostsResultModel.value!.accounts[index].dogName,
                  'nickname': SearchPostsResultController.to
                      .searchPostsResultModel.value!.accounts[index].nickname,
                });
              },
              child: Row(
                children: [
                  CustomText(
                    text: SearchPostsResultController.to.searchPostsResultModel
                        .value!.accounts[index].dogName,
                    color: StaticColor.font_main,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    height: (24 / 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: CustomText(
                      text: SearchPostsResultController
                          .to
                          .searchPostsResultModel
                          .value!
                          .accounts[index]
                          .nickname,
                      color: Color(0xff7D7D7D),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget _postsResultByBreed() {
    if (SearchPostsResultController
        .to.searchPostsResultModel.value!.breeds.isEmpty) {
      return noResultWidget('견종이');
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: SearchPostsResultController
            .to.searchPostsResultModel.value!.breeds.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/posts', arguments: {
                  'query': SearchPostsResultController
                      .to.searchPostsResultModel.value!.breeds[index],
                  'searchType': 'breed'
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: SearchPostsResultController
                          .to.searchPostsResultModel.value!.breeds[index],
                      color: StaticColor.font_main,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14.r,
                    color: Color(0xffA6A6A6),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget noResultWidget(String type) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Container(
            width: 194.r,
            height: 194.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/illusts/no_breed.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          CustomText(
            text: '앗... 검색 결과가 없어요.',
            color: StaticColor.font_main,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: (32 / 16),
          ),
          SizedBox(height: 8.h),
          CustomText(
            text:
                '\'${widget.query}\' 과 일치하는 $type 없어요 ㅠㅠ\n       다른 검색어를 입력해보세요.',
            color: StaticColor.icon,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 14),
          ),
        ],
      ),
    );
  }
}
