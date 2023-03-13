import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RandomPositionSticker extends StatelessWidget {
  RandomPositionSticker({
    Key? key,
    required this.shape,
    required this.size,
    required this.radians,
    required this.top,
    required this.left,
  }) : super(key: key);

  String shape;
  double size;
  double radians;
  double top;
  double left;

  @override
  Widget build(BuildContext context) {
    int stickerIndex = Random().nextInt(4);
    if (shape == 'rectangle') {
      return Positioned(
        top: top,
        left: left,
        child: Transform.rotate(
          angle: radians,
          child: Container(
            width: size,
            height: size * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2.r,
                ),
              ],
              image: DecorationImage(
                image: AssetImage('assets/sticker${stickerIndex + 1}.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        top: top,
        left: left,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size / 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2.r,
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/sticker${stickerIndex + 1}.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }
}
