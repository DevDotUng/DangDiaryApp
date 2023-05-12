import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewIndicator extends StatefulWidget {
  PageViewIndicator(
      {Key? key, required this.itemCount, required this.pageController})
      : super(key: key);
  late int itemCount;
  late PageController pageController;

  @override
  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  late ScrollController _scrollController;
  double _page = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    widget.pageController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (mounted) {
      setState(() {
        _page = widget.pageController.page!;
      });
      if (_page > 0 && _page < widget.itemCount - 1) {
        _scrollController.jumpTo((_page - 1) * 20);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.itemCount == 1 || widget.itemCount == 2
          ? EdgeInsets.only(left: 20.w)
          : EdgeInsets.zero,
      child: SizedBox(
        width: 56.w,
        height: 4.h,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.itemCount,
          itemBuilder: (context, index) {
            return Container(
              margin: getEdgeInsets(index),
              width: 16.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: index > _page - 0.5 && index <= _page + 0.5
                    ? StaticColor.main_light
                    : StaticColor.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
            );
          },
        ),
      ),
    );
  }

  EdgeInsets getEdgeInsets(int index) {
    if (index == 0) {
      return EdgeInsets.only(right: 2.w);
    } else if (index == widget.itemCount - 1) {
      return EdgeInsets.only(left: 2.w);
    } else {
      return EdgeInsets.only(left: 2.w, right: 2.w);
    }
  }
}
