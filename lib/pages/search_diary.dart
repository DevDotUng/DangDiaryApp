import 'package:dangdiarysample/components/cover_color.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/search_diary_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchDiary extends StatelessWidget {
  const SearchDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDiaryController());
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
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              size: 32.r,
              color: Colors.black,
            ),
          ),
          title: CustomText(
            text: '일기장 검색하기',
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
                            SearchDiaryController.to.textEditingController,
                        onChanged: (String text) {
                          SearchDiaryController.to.changeTextListener(text);
                        },
                        onSubmitted: (text) {
                          SearchDiaryController.to.search(context, text);
                        },
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorWidth: 1.w,
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
                          hintText: '챌린지명 또는 일기 제목으로 검색해보세요.',
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
                      () => SearchDiaryController.to.searchText.isEmpty
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                SearchDiaryController.to.textEditingController
                                    .clear();
                                SearchDiaryController.to.searchTextClear();
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
                      () => SearchDiaryController
                              .to.searchMyDiaryModelList.isEmpty
                          ? SearchDiaryController.to.searchText.isEmpty
                              ? _searchHistoryList()
                              : _autoCompleteList()
                          : _searchResultList(),
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
            text: SearchDiaryController.to.searchMyDiaryModelList.isEmpty
                ? SearchDiaryController.to.searchText.isEmpty
                    ? '최근검색어'
                    : '자동검색어'
                : '검색 결과',
            color: Color(0xffA6A6A6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SearchDiaryController.to.searchHistory.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
              child: GestureDetector(
                onTap: () {
                  SearchDiaryController.to.searchByHistoryOrAutoCompleteWord(
                      context, SearchDiaryController.to.searchHistory[index]);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: SearchDiaryController.to.searchHistory[index],
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
                        SearchDiaryController.to.deleteHistory(index);
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
            text: SearchDiaryController.to.searchMyDiaryModelList.isEmpty
                ? SearchDiaryController.to.searchText.isEmpty
                    ? '최근검색어'
                    : '자동검색어'
                : '검색 결과',
            color: Color(0xffA6A6A6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SearchDiaryController.to.autoCompleteWord.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 8.w, 16.h),
              child: GestureDetector(
                onTap: () {
                  SearchDiaryController.to.searchByHistoryOrAutoCompleteWord(
                      context,
                      SearchDiaryController.to.autoCompleteWord[index]);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: SearchDiaryController.to.autoCompleteWord[index],
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

  Widget _searchResultList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomText(
            text: SearchDiaryController.to.searchMyDiaryModelList.isEmpty
                ? SearchDiaryController.to.searchText.isEmpty
                    ? '최근검색어'
                    : '자동검색어'
                : '검색 결과',
            color: Color(0xffA6A6A6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: (20 / 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: SearchDiaryController.to.searchMyDiaryModelList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/diary', arguments: {
                  'coverId': SearchDiaryController
                      .to.searchMyDiaryModelList[index].coverId,
                  'diaryId': SearchDiaryController
                      .to.searchMyDiaryModelList[index].diaryId,
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 8.h),
                width: double.infinity,
                height: 56.h,
                decoration: BoxDecoration(
                  color: CoverColor().getCoverColor(SearchDiaryController
                      .to.searchMyDiaryModelList[index].coverColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: StaticColor.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          getFormattedDate(
                              SearchDiaryController
                                  .to.searchMyDiaryModelList[index].endDate,
                              'yy년 MM월 dd일'),
                          style: TextStyle(
                            color: StaticColor.font_main,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      SearchDiaryController
                          .to.searchMyDiaryModelList[index].diaryTitle,
                      style: TextStyle(
                        color: Color(0xff222222),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    StaticIcon(
                      IconsPath.like,
                      size: 16.r,
                      color: Color(0xff272727),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${SearchDiaryController.to.searchMyDiaryModelList[index].numberOfLike}',
                      style: TextStyle(
                        color: StaticColor.font_main,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String getFormattedDate(String date, String format) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat(format).format(dateTime);

    return formattedDate;
  }
}
