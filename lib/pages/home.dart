import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/home_controller.dart';
import 'package:dangdiarysample/pages/notification_page.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(
      () => HomeController.to.homeModel.value == null
          ? HomeSkeleton()
          : _homeWidget(context),
    );
  }

  Widget _homeWidget(BuildContext context) {
    double _appBarHeight = _appBar(context).preferredSize.height;
    double _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: HomeController.to.homeModel.value?.backgroundImage ==
                        null
                    ? AssetImage('assets/dog3.png') as ImageProvider
                    : NetworkImage(PublicRepository().getDiaryImageUrl(
                        HomeController.to.homeModel.value!.backgroundImage)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: (_appBarHeight + _statusBarHeight + 16).h,
            left: 24.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: '오늘의 일일챌린지가\n도착했어요!',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  height: (32 / 24),
                ),
              ],
            ),
          ),
          Positioned(
            top: (_appBarHeight + _statusBarHeight + 20).h,
            right: 24.w,
            child: GestureDetector(
              onTap: () {
                BottomNavController.to.changeBottomNav(3);
              },
              child: Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0.r),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8.r,
                    ),
                  ],
                  image: DecorationImage(
                    image: HomeController.to.homeModel.value?.profileImage ==
                            null
                        ? AssetImage('assets/default_profile_image.png')
                            as ImageProvider
                        : NetworkImage(PublicRepository().getProfileImageUrl(
                            HomeController.to.homeModel.value!.profileImage)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Stack(
                children: [
                  StaticIcon(
                    IconsPath.notification_off,
                    size: 32.w,
                    color: StaticColor.icon,
                  ),
                  Positioned(
                    top: 0,
                    right: 5.w,
                    child: Container(
                      width: 4.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
