import 'dart:async';

import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget({Key? key, required this.duration}) : super(key: key);

  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;
  late Duration countdownDuration;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with AutomaticKeepAliveClientMixin {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void initState() {
    widget.countdownDuration = widget.duration;
    reset();
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: 100.w,
      height: 22.h,
      decoration: BoxDecoration(
        color: StaticColor.main,
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Center(
        child: Text(
          '${twoDigits(widget.duration.inHours)}:${twoDigits(widget.duration.inMinutes.remainder(60))}:${twoDigits(widget.duration.inSeconds.remainder(60))} 남음',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      widget.duration = widget.countdownDuration;
      widget.countDown = true;
    });
  }

  void startTimer() {
    setState(() {
      widget.timer =
          Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    });
  }

  void addTime() {
    setState(() {
      if (!widget.countDown) {
        BottomNavController.to.challengeInit();
      }
      final addSeconds = widget.countDown ? -1 : 0;
      final seconds = widget.duration.inSeconds + addSeconds;
      if (seconds < 0) {
        widget.countDown = false;
        // timer?.cancel();
      } else {
        widget.duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    setState(() {
      if (resets) {
        reset();
      }
      widget.timer?.cancel();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
