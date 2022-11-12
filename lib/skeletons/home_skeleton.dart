import 'package:flutter/material.dart';
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
              top: 90,
              left: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 150,
                      height: 32,
                    ),
                  ),
                  SizedBox(height: 8),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 200,
                      height: 32,
                    ),
                  ),
                  SizedBox(height: 8),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: 100,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              right: 24,
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: 56,
                  height: 56,
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
