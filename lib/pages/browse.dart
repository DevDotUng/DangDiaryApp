import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/browse_controller.dart';
import 'package:dangdiarysample/skeletons/browse_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Browse extends StatelessWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BrowseController());
    return Obx(
      () => BrowseController.to.isLoading.value
          ? BrowseSkeleton()
          : _browseWidget(context),
    );
  }

  Widget _browseWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Container(),
          centerTitle: true,
          title: CustomText(
            text: '둘러보기',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: (32 / 16),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Focus(
                        onFocusChange: (isFocus) {
                          if (isFocus == true) {
                            BrowseController.to.changeFocus(isFocus);
                          }
                        },
                        child: TextField(
                          cursorColor: Color(0xff202020),
                          cursorWidth: 1.w,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff0A0A0A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: (24 / 14).h,
                          ),
                          decoration: InputDecoration(
                            hintText: '어떤 이야기를 찾아볼까요?',
                            hintStyle: TextStyle(
                              color: Color(0xffA6A6A6),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: (24 / 14).h,
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 8.0.w, top: 24.h),
                            suffixIcon: Icon(
                              Icons.search,
                              size: 16.r,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: BorderSide(
                                width: 0.0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => BrowseController.to.isFocus.value
                        ? Padding(
                            padding: EdgeInsets.only(left: 12.0.w),
                            child: GestureDetector(
                              onTap: () {
                                BrowseController.to.changeFocus(false);
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                width: 16.w,
                                height: 16.h,
                                child: Center(
                                  child: Icon(Icons.clear, size: 15.r),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Obx(
                () => BrowseController.to.isFocus.value
                    ? _searchHistory()
                    : _posts(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _posts() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7.w,
          mainAxisSpacing: 8.h,
          mainAxisExtent: 221.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/post');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage('assets/dog.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _searchHistory() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.h),
            child: CustomText(
              text: '이전 검색 기록',
              color: Color(0xffA6A6A6),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: (24 / 12),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(18.0.r),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '미션 산책하며 물먹기',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: (20 / 14),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '101개의 일기',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 12),
                          ),
                          SizedBox(width: 13.w),
                          Icon(Icons.clear, size: 16.r),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
