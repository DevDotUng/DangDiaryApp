import 'package:dangdiarysample/components/custom_back_button.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/report_dropdown_container.dart';
import 'package:dangdiarysample/controllers/customer_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerCenterController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CustomBackButton(),
        ),
        title: CustomText(
          text: '공지사항',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Expanded(
              child: ListView.builder(
                itemCount: CustomerCenterController
                    .to.customerCenter.value?.notices.length,
                itemBuilder: (context, index) {
                  return NoticeDropdown(
                    title:
                        '[공지] ${CustomerCenterController.to.customerCenter.value?.notices[index].title}',
                    registerDate: CustomerCenterController
                        .to.customerCenter.value!.notices[index].registerDate,
                    content: CustomerCenterController
                        .to.customerCenter.value!.notices[index].content,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
