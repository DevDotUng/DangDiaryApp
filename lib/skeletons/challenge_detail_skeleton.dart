import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class ChallengeDetailSkeleton extends StatelessWidget {
  const ChallengeDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Get.height - 228.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: ListView(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 168.w,
                        height: 32.h,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 184.w,
                            height: 24.h,
                          ),
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 104.w,
                            height: 32.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 136.h,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 116.h,
                      ),
                    ),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 175.w,
                            height: 24.h,
                          ),
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 104.h,
                      ),
                    ),
                    SizedBox(height: 49.h),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 48.h,
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
