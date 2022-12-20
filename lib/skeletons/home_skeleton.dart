import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 90.h,
              left: 24.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 150.w,
                      height: 32.h,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 200.w,
                      height: 32.h,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 100.w,
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90.h,
              right: 24.w,
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: 56.w,
                  height: 56.h,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
