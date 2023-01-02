import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.height = 1.2,
    this.overflow,
    this.decoration,
    this.maxLines,
  }) : super(key: key);

  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  double height;
  TextOverflow? overflow;
  TextDecoration? decoration;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    double bottomPadding = (height * fontSize - fontSize) / 2;
    double baseline = height * fontSize - height * fontSize / 4;
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Baseline(
        baselineType: TextBaseline.alphabetic,
        baseline: baseline,
        child: Text(
          text,
          maxLines: maxLines,
          overflow: overflow,
          style: TextStyle(
            color: color,
            height: height,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        ),
      ),
    );
  }
}
