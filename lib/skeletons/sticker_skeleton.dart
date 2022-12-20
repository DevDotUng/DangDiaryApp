import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class StickerSkeleton extends StatelessWidget {
  const StickerSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: Get.height * 0.6 + 24.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: 100.w,
                              height: 30.h,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: 200.w,
                              height: 30.h,
                            ),
                          ),
                        ],
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 56.w,
                          height: 56.h,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 80.w,
                          height: 30.h,
                        ),
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 180.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 24.w, top: 24.h),
              width: Get.width,
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 80.w,
                          height: 20.h,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 184.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, jndex) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.0.w),
                              child: Column(
                                children: [
                                  SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      width: 104.w,
                                      height: 104.h,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      width: 104.w,
                                      height: 30.h,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
