import 'package:flutter/material.dart';
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
            bottom: Get.height * 0.6 + 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                              width: 100,
                              height: 30,
                            ),
                          ),
                          SizedBox(height: 8),
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              width: 200,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 56,
                          height: 56,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 80,
                          height: 30,
                        ),
                      ),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 180,
                          height: 30,
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
              padding: const EdgeInsets.only(left: 24, top: 24),
              width: Get.width,
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
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
                          width: 80,
                          height: 20,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 184,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, jndex) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                  SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      width: 104,
                                      height: 104,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                      width: 104,
                                      height: 30,
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
