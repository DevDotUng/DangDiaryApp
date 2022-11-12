import 'package:flutter/material.dart';
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
              height: Get.height - 228,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView(
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: 168,
                        height: 32,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 184,
                            height: 24,
                          ),
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 104,
                            height: 32,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 136,
                      ),
                    ),
                    SizedBox(height: 24),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 116,
                      ),
                    ),
                    SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 175,
                            height: 24,
                          ),
                        ),
                        SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 104,
                      ),
                    ),
                    SizedBox(height: 49),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        width: double.infinity,
                        height: 48,
                      ),
                    ),
                    SizedBox(height: 32),
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
