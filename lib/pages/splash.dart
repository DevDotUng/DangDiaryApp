import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/repositories/splash_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class Splash extends StatefulWidget {
  Splash({Key? key, this.firebaseToken}) : super(key: key);

  String? firebaseToken;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> login() async {
    int response =
        await SplashRepository().getSplashResponse(widget.firebaseToken);

    if (response == 200) {
      Get.offAndToNamed('/app');
    } else if (response == 300) {
      Get.offAndToNamed('/');
    } else {
      Get.offAndToNamed('/login');
    }
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: '댕댕일기 스플래시',
          color: StaticColor.icon,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          height: (20 / 12),
        ),
      ),
    );
  }
}
