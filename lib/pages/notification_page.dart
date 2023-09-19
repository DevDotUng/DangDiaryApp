import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/home_controller.dart';
import 'package:dangdiarysample/models/home/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notifications =
        HomeController.to.homeModel.value!.notifications;
    for (NotificationModel notification in notifications) {
      print(notification.registerDate);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomBackButton(),
        ),
        title: Text(
          '알림',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: Border(
          bottom: BorderSide(color: Color(0xffD9D9D9)),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.only(
              bottom: ReactiveDevice().hasHomeIndicator() ? 171.h : 137.h),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (notifications[index].type == 'like') {
                  Get.toNamed('/diary', arguments: {
                    'coverId': notifications[index].coverId,
                    'diaryId': notifications[index].diaryId
                  });
                } else {
                  BottomNavController.to.changeIsShowBottomModal();
                }
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      constraints: BoxConstraints(minHeight: 47.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 24.w),
                          Expanded(
                            child: CustomText(
                              text: notifications[index].content,
                              color: Color(0xff545454),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: (20 / 14),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          CustomText(
                            text: getTime(notifications[index].registerDate),
                            color: Color(0xff7D7D7D),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: (20 / 12),
                          ),
                          SizedBox(width: 24.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 1.h,
                      color: Color(0xffF5F5F5),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String getTime(String date) {
    Duration duration = DateTime.now().difference(DateTime.parse(date));

    int day = duration.inDays;

    if (day >= 365) {
      return (day ~/ 365).toString() + '년 전';
    }

    if (day >= 30) {
      return (day ~/ 30).toString() + '달 전';
    }

    if (day >= 7) {
      return (day ~/ 7).toString() + '주 전';
    }

    if (day >= 1) {
      return (day ~/ 1).toString() + '일 전';
    }

    if (duration.inHours >= 1) {
      return (duration.inHours ~/ 1).toString() + '시간 전';
    }

    if (duration.inMinutes >= 1) {
      return (duration.inMinutes ~/ 1).toString() + '분 전';
    }

    return '지금';
  }
}
