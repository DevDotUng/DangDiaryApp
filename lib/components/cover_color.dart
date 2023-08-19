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
  VIOLET,
  PURPLE,
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
  HOLDER_VIOLET,
  HOLDER_PURPLE,
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
      case 'purple':
        return coverColorList[coverColors.PURPLE.index];
      case 'lavender':
        return coverColorList[coverColors.LAVENDER.index];
      case 'pink':
        return coverColorList[coverColors.PINK.index];
      default:
        return coverColorList[coverColors.BLUE.index];
    }
  }

  String getCoverColorString(color) {
    final map = {
      coverColorList[coverColors.RED.index]: 'red',
      coverColorList[coverColors.PEACH.index]: 'peach',
      coverColorList[coverColors.CHERRY.index]: 'cherry',
      coverColorList[coverColors.ORANGE.index]: 'orange',
      coverColorList[coverColors.YELLOW.index]: 'yellow',
      coverColorList[coverColors.LEMON.index]: 'lemon',
      coverColorList[coverColors.GREEN.index]: 'green',
      coverColorList[coverColors.LIME.index]: 'lime',
      coverColorList[coverColors.LEAF.index]: 'leaf',
      coverColorList[coverColors.MINT.index]: 'mint',
      coverColorList[coverColors.BLUE.index]: 'blue',
      coverColorList[coverColors.SKY.index]: 'sky',
      coverColorList[coverColors.VIOLET.index]: 'violet',
      coverColorList[coverColors.PURPLE.index]: 'purple',
      coverColorList[coverColors.LAVENDER.index]: 'lavender',
      coverColorList[coverColors.PINK.index]: 'pink',
    };
    String coverColorString = map[color] ?? 'blue';

    return coverColorString;
  }

  Color getHolderColor(String? colorName) {
    switch (colorName) {
      case 'holder_red':
        return holderColorList[holderColors.HOLDER_RED.index];
      case 'holder_peach':
        return holderColorList[holderColors.HOLDER_PEACH.index];
      case 'holder_cherry':
        return holderColorList[holderColors.HOLDER_CHERRY.index];
      case 'holder_orange':
        return holderColorList[holderColors.HOLDER_ORANGE.index];
      case 'holder_yellow':
        return holderColorList[holderColors.HOLDER_YELLOW.index];
      case 'holder_lemon':
        return holderColorList[holderColors.HOLDER_LEMON.index];
      case 'holder_green':
        return holderColorList[holderColors.HOLDER_GREEN.index];
      case 'holder_lime':
        return holderColorList[holderColors.HOLDER_LIME.index];
      case 'holder_leaf':
        return holderColorList[holderColors.HOLDER_LEAF.index];
      case 'holder_mint':
        return holderColorList[holderColors.HOLDER_MINT.index];
      case 'holder_blue':
        return holderColorList[holderColors.HOLDER_BLUE.index];
      case 'holder_sky':
        return holderColorList[holderColors.HOLDER_SKY.index];
      case 'holder_purple':
        return holderColorList[holderColors.HOLDER_PURPLE.index];
      case 'holder_lavender':
        return holderColorList[holderColors.HOLDER_LAVENDER.index];
      case 'holder_pink':
        return holderColorList[holderColors.HOLDER_PINK.index];
      default:
        return holderColorList[holderColors.HOLDER_BLUE.index];
    }
  }

  String getHolderColorString(color) {
    final map = {
      holderColorList[holderColors.HOLDER_RED.index]: 'holder_red',
      holderColorList[holderColors.HOLDER_PEACH.index]: 'holder_peach',
      holderColorList[holderColors.HOLDER_ORANGE.index]: 'holder_orange',
      holderColorList[holderColors.HOLDER_YELLOW.index]: 'holder_yellow',
      holderColorList[holderColors.HOLDER_CHERRY.index]: 'holder_cherry',
      holderColorList[holderColors.HOLDER_LEMON.index]: 'holder_lemon',
      holderColorList[holderColors.HOLDER_GREEN.index]: 'holder_green',
      holderColorList[holderColors.HOLDER_LIME.index]: 'holder_lime',
      holderColorList[holderColors.HOLDER_LEAF.index]: 'holder_leaf',
      holderColorList[holderColors.HOLDER_MINT.index]: 'holder_mint',
      holderColorList[holderColors.HOLDER_BLUE.index]: 'holder_blue',
      holderColorList[holderColors.HOLDER_SKY.index]: 'holder_sky',
      holderColorList[holderColors.HOLDER_VIOLET.index]: 'holder_violet',
      holderColorList[holderColors.HOLDER_PURPLE.index]: 'holder_purple',
      holderColorList[holderColors.HOLDER_LAVENDER.index]: 'holder_lavender',
      holderColorList[holderColors.HOLDER_PINK.index]: 'holder_pink',
    };
    String holderColorString = map[color] ?? 'holder_blue';

    return holderColorString;
  }
}
