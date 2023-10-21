import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/my_report_history_controller.dart';
import 'package:dangdiarysample/models/customer_center/report_history_model.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyReportHistory extends StatelessWidget {
  const MyReportHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyReportHistoryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StaticColor.sub_light,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CustomBackButton(),
        ),
        title: CustomText(
          text: '신고내역',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                color: StaticColor.sub_light,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        CustomText(
                          text: '진행중인 신고 ',
                          color: Color(0xff272727),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                        Obx(
                          () => CustomText(
                            text:
                                '${MyReportHistoryController.to.processReportList.length + MyReportHistoryController.to.receivedReportList.length}건',
                            color: StaticColor.error,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => Column(
                        children: [
                          ...List.generate(
                            MyReportHistoryController
                                .to.processReportList.length,
                            (index) => _reportWidget(MyReportHistoryController
                                .to.processReportList[index]),
                          ),
                          ...List.generate(
                            MyReportHistoryController
                                .to.receivedReportList.length,
                            (index) => _reportWidget(MyReportHistoryController
                                .to.receivedReportList[index]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        CustomText(
                          text: '처리 완료된 신고 ',
                          color: Color(0xff272727),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: (32 / 18),
                        ),
                        Obx(
                          () => CustomText(
                            text:
                                '${MyReportHistoryController.to.completeReportList.length}건',
                            color: Color(0xff696969),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 18),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Obx(
                      () => Column(
                        children: List.generate(
                          MyReportHistoryController
                              .to.completeReportList.length,
                          (index) => _reportWidget(MyReportHistoryController
                              .to.completeReportList[index]),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportWidget(ReportHistoryModel reportHistoryModel) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/reportDetail',
            arguments: {'reportHistoryModel': reportHistoryModel});
      },
      child: Container(
        margin: EdgeInsets.only(top: 8.h),
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Color(0xffEAEAEA),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 16.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              height: 24.h,
              decoration: BoxDecoration(
                  color: _getColor(reportHistoryModel.status),
                  borderRadius: BorderRadius.circular(10.r),
                  border: reportHistoryModel.status == '접수 완료'
                      ? Border.all(color: StaticColor.sub_deeper)
                      : null),
              child: Center(
                child: Text(
                  reportHistoryModel.status,
                  style: TextStyle(
                    color: reportHistoryModel.status == '접수 완료'
                        ? StaticColor.sub_deeper
                        : Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                reportHistoryModel.title,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20.r,
              color: Color(0xffA6A6A6),
            ),
            SizedBox(width: 18.w),
          ],
        ),
      ),
    );
  }

  Color _getColor(String progress) {
    switch (progress) {
      case '신고 처리중':
        return StaticColor.error;
      case '접수 완료':
        return StaticColor.white;
      case '처리 완료':
        return StaticColor.link;
      default:
        return StaticColor.link;
    }
  }
}
