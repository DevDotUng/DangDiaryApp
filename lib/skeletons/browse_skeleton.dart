import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class BrowseSkeleton extends StatelessWidget {
  const BrowseSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        color: Colors.white,
        child: Column(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 40.h,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7.w,
                  mainAxisSpacing: 8.h,
                  mainAxisExtent: 221.h,
                ),
                itemBuilder: (context, index) {
                  return SkeletonAvatar();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
