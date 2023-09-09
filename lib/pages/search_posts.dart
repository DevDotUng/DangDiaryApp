import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/search_posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPosts extends StatefulWidget {
  SearchPosts({Key? key, required this.autoCompleteWords}) : super(key: key);

  List<String> autoCompleteWords;

  @override
  State<SearchPosts> createState() => _SearchPostsState();
}

class _SearchPostsState extends State<SearchPosts> {
  @override
  void dispose() {
    Get.delete<SearchPostsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SearchPostsController(autoCompleteWords: widget.autoCompleteWords));
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomBackButton(),
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
                        controller:
                            SearchPostsController.to.textEditingController,
                        onChanged: (String text) {
                          SearchPostsController.to.changeTextListener(text);
                        },
                        onSubmitted: (text) {
                          SearchPostsController.to.search(context, text);
                        },
                        autofocus: true,
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
                      () => SearchPostsController.to.searchText.isEmpty
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                SearchPostsController.to.textEditingController
                                    .clear();
                                SearchPostsController.to.searchTextClear();
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
              SizedBox(height: 16.h),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onPanDown: (_) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SingleChildScrollView(
                    child: Obx(
                      () => SearchPostsController.to.searchText.isEmpty
                          ? _searchHistoryList()
                          : _autoCompleteList(),
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

  Widget _searchHistoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomText(
            text:
                SearchPostsController.to.searchText.isEmpty ? '최근검색어' : '자동검색어',
            color: Color(0xffA6A6A6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SearchPostsController.to.searchHistory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
                child: GestureDetector(
                  onTap: () {
                    SearchPostsController.to.search(
                        context, SearchPostsController.to.searchHistory[index]);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: SearchPostsController.to.searchHistory[index],
                          color: Color(0xff6B6B6B),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: (24 / 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () {
                          SearchPostsController.to.searchHistory
                              .removeAt(index);
                        },
                        child: Icon(
                          Icons.clear,
                          size: 14.r,
                          color: Color(0xffA6A6A6),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _autoCompleteList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomText(
            text:
                SearchPostsController.to.searchText.isEmpty ? '최근검색어' : '자동검색어',
            color: Color(0xffA6A6A6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SearchPostsController.to.autoCompleteWord.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
              child: GestureDetector(
                onTap: () {
                  SearchPostsController.to.search(context,
                      SearchPostsController.to.autoCompleteWord[index]);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: SearchPostsController.to.autoCompleteWord[index],
                        color: Color(0xff6B6B6B),
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
        ),
      ],
    );
  }
}
