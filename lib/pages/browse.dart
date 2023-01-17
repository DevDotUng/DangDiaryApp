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
          centerTitle: true,
          title: CustomText(
            text: '둘러보기',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            height: (28 / 20),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/searchPosts');
                },
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 32.r,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0),
          color: Colors.white,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index % 3 == 0) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xffD9D9D9)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(24.w, 24.h, 0, 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '지난 주 가장 인기 있는 일기에\n선정되었어요!',
                                color: Color(0xff222222),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                height: (30 / 20),
                              ),
                              SizedBox(height: 6.h),
                              CustomText(
                                text: '축하해요 🎉',
                                color: Color(0xff545454),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          color: Color(0xff7B61FF),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/posts');
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    width: double.infinity,
                    height: 410.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Color(0xffD9D9D9)),
                      image: DecorationImage(
                        image: AssetImage('assets/dog.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(24.w, 24.h, 0, 24.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: '지난 주\n가장 인기 있는 일기',
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  height: (32 / 24),
                                ),
                                SizedBox(height: 8.h),
                                CustomText(
                                  text: '지난 주에 좋아요를 가장 많이 받은 일기를 모아봤어요.',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 40.h, 24.w, 0),
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 24.r,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
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
