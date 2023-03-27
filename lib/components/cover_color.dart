import 'package:flutter/material.dart';

enum coverColors {
  RED,
  PEACH,
  CHERRY,
  ORANGE,
  YELLOW,
  LEMON,
  GREEN,
  LIME,
  LEAF,
  MINT,
  BLUE,
  SKY,
  PUPLE,
  LAVENDER,
  PINK,
}

enum holderColors {
  HOLDER_RED,
  HOLDER_PEACH,
  HOLDER_CHERRY,
  HOLDER_ORANGE,
  HOLDER_YELLOW,
  HOLDER_LEMON,
  HOLDER_GREEN,
  HOLDER_LIME,
  HOLDER_LEAF,
  HOLDER_MINT,
  HOLDER_BLUE,
  HOLDER_SKY,
  HOLDER_PUPLE,
  HOLDER_LAVENDER,
  HOLDER_PINK,
}

class CoverColor {
  List coverColorList = [
    Color(0xffFF9686),
    Color(0xffFFB393),
    Color(0xffFFCDB8),
    Color(0xffFFA251),
    Color(0xffFFD84B),
    Color(0xffFFE092),
    Color(0xffB0DBAB),
    Color(0xffD5E5AB),
    Color(0xffECF3AE),
    Color(0xff9CE1CF),
    Color(0xffB6CAFF),
    Color(0xffD3E0FF),
    Color(0xffCF8EF5),
    Color(0xffE3B2FF),
    Color(0xffEFD4FF),
    Color(0xffFBE7ED),
  ];
  List holderColorList = [
    Color(0xffEF7260),
    Color(0xffFB956B),
    Color(0xffFFB697),
    Color(0xffF38928),
    Color(0xffFFBA34),
    Color(0xffFFD464),
    Color(0xff77D380),
    Color(0xffBEDE69),
    Color(0xffDDED53),
    Color(0xff3AD4AC),
    Color(0xff8BACFF),
    Color(0xffB5C9FF),
    Color(0xffA752DA),
    Color(0xffC77EF2),
    Color(0xffDEA9FF),
    Color(0xffFFB7CC),
  ];

  Color getCoverColor(String? colorName) {
    switch (colorName) {
      case 'red':
        return coverColorList[coverColors.RED.index];
      case 'peach':
        return coverColorList[coverColors.PEACH.index];
      case 'cherry':
        return coverColorList[coverColors.CHERRY.index];
      case 'orange':
        return coverColorList[coverColors.ORANGE.index];
      case 'yellow':
        return coverColorList[coverColors.YELLOW.index];
      case 'lemon':
        return coverColorList[coverColors.LEMON.index];
      case 'green':
        return coverColorList[coverColors.GREEN.index];
      case 'lime':
        return coverColorList[coverColors.LIME.index];
      case 'leaf':
        return coverColorList[coverColors.LEAF.index];
      case 'mint':
        return coverColorList[coverColors.MINT.index];
      case 'blue':
        return coverColorList[coverColors.BLUE.index];
      case 'sky':
        return coverColorList[coverColors.SKY.index];
      case 'puple':
        return coverColorList[coverColors.PUPLE.index];
      case 'lavender':
        return coverColorList[coverColors.LAVENDER.index];
      case 'pink':
        return coverColorList[coverColors.PINK.index];
      default:
        return coverColorList[coverColors.BLUE.index];
    }
  }

  Color getHolderColor(String? colorName) {
    switch (colorName) {
      case 'holder_red':
        return coverColorList[holderColors.HOLDER_RED.index];
      case 'holder_peach':
        return coverColorList[holderColors.HOLDER_PEACH.index];
      case 'holder_cherry':
        return coverColorList[holderColors.HOLDER_CHERRY.index];
      case 'holder_orange':
        return coverColorList[holderColors.HOLDER_ORANGE.index];
      case 'holder_yellow':
        return coverColorList[holderColors.HOLDER_YELLOW.index];
      case 'holder_lemon':
        return coverColorList[holderColors.HOLDER_LEMON.index];
      case 'holder_green':
        return coverColorList[holderColors.HOLDER_GREEN.index];
      case 'holder_lime':
        return coverColorList[holderColors.HOLDER_LIME.index];
      case 'holder_leaf':
        return coverColorList[holderColors.HOLDER_LEAF.index];
      case 'holder_mint':
        return coverColorList[holderColors.HOLDER_MINT.index];
      case 'holder_blue':
        return coverColorList[holderColors.HOLDER_BLUE.index];
      case 'holder_sky':
        return coverColorList[holderColors.HOLDER_SKY.index];
      case 'holder_puple':
        return coverColorList[holderColors.HOLDER_PUPLE.index];
      case 'holder_lavender':
        return coverColorList[holderColors.HOLDER_LAVENDER.index];
      case 'holder_pink':
        return coverColorList[holderColors.HOLDER_PINK.index];
      default:
        return coverColorList[holderColors.HOLDER_BLUE.index];
    }
  }
}
