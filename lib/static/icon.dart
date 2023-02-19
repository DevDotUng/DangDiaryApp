import 'package:dangdiarysample/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaticIcon extends StatelessWidget {
  String icon;
  final double size;
  final Color color;
  StaticIcon(this.icon,
      {Key? key, this.size = 24, this.color = StaticColor.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon, width: size, height: size, color: color);
  }
}

class IconsPath {
  static String get back => 'assets/icons/back.svg';
  static String get back_arrow => 'assets/icons/back_arrow.svg';
  static String get back_arrow_bold => 'assets/icons/back_arrow_bold.svg';
  static String get back_bold => 'assets/icons/back_bold.svg';
  static String get calender => 'assets/icons/calender.svg';
  static String get calender_bold => 'assets/icons/calender_bold.svg';
  static String get caution => 'assets/icons/caution.svg';
  static String get caution_bold => 'assets/icons/caution_bold.svg';
  static String get challenge => 'assets/icons/challenge.svg';
  static String get challenge_bold => 'assets/icons/challenge_bold.svg';
  static String get check_bold => 'assets/icons/check_bold.svg';
  static String get cloudy => 'assets/icons/cloudy.svg';
  static String get cloudy_bold => 'assets/icons/cloudy_bold.svg';
  static String get consult => 'assets/icons/consult.svg';
  static String get consult_bold => 'assets/icons/consult_bold.svg';
  static String get copy => 'assets/icons/copy.svg';
  static String get copy_bold => 'assets/icons/copy_bold.svg';
  static String get customer_center => 'assets/icons/customer_center.svg';
  static String get customer_center_bold =>
      'assets/icons/customer_center_bold.svg';
  static String get diary => 'assets/icons/diary.svg';
  static String get diary_bold => 'assets/icons/diary_bold.svg';
  static String get dogface => 'assets/icons/dogface.svg';
  static String get dogface_bold => 'assets/icons/dogface_bold.svg';
  static String get female => 'assets/icons/female.svg';
  static String get female_bold => 'assets/icons/female_bold.svg';
  static String get fog => 'assets/icons/fog.svg';
  static String get fog_bold => 'assets/icons/fog_bold.svg';
  static String get forward => 'assets/icons/forward.svg';
  static String get forward_bold => 'assets/icons/forward_bold.svg';
  static String get hashtag => 'assets/icons/hashtag.svg';
  static String get hashtag_bold => 'assets/icons/hashtag_bold.svg';
  static String get history => 'assets/icons/history.svg';
  static String get history_bold => 'assets/icons/history_bold.svg';
  static String get home => 'assets/icons/home.svg';
  static String get home_bold => 'assets/icons/home_bold.svg';
  static String get like => 'assets/icons/like.svg';
  static String get like_outlined => 'assets/icons/like_outlined.svg';
  static String get like_outlined_bold => 'assets/icons/like_outlined_bold.svg';
  static String get location => 'assets/icons/location.svg';
  static String get location_bold => 'assets/icons/location_bold.svg';
  static String get lock => 'assets/icons/lock.svg';
  static String get lock_bold => 'assets/icons/lock_bold.svg';
  static String get male => 'assets/icons/male.svg';
  static String get male_bold => 'assets/icons/male_bold.svg';
  static String get message => 'assets/icons/message.svg';
  static String get message_bold => 'assets/icons/message_bold.svg';
  static String get more_bold => 'assets/icons/more_bold.svg';
  static String get my => 'assets/icons/my.svg';
  static String get my_bold => 'assets/icons/my_bold.svg';
  static String get notification_off => 'assets/icons/notification_off.svg';
  static String get notification_off_bold =>
      'assets/icons/notification_off_bold.svg';
  static String get notification_on => 'assets/icons/notification_on.svg';
  static String get notification_on_bold =>
      'assets/icons/notification_on_bold.svg';
  static String get photo => 'assets/icons/photo.svg';
  static String get photo_bold => 'assets/icons/photo_bold.svg';
  static String get plus => 'assets/icons/plus.svg';
  static String get plus_bold => 'assets/icons/plus_bold.svg';
  static String get question => 'assets/icons/question.svg';
  static String get question_bold => 'assets/icons/question_bold.svg';
  static String get quit => 'assets/icons/quit.svg';
  static String get quit_bold => 'assets/icons/quit_bold.svg';
  static String get rain => 'assets/icons/rain.svg';
  static String get rain_bold => 'assets/icons/rain_bold.svg';
  static String get report => 'assets/icons/report.svg';
  static String get report_bold => 'assets/icons/report_bold.svg';
  static String get search => 'assets/icons/search.svg';
  static String get search_bold => 'assets/icons/search_bold.svg';
  static String get setting => 'assets/icons/setting.svg';
  static String get setting_bold => 'assets/icons/setting_bold.svg';
  static String get share => 'assets/icons/share.svg';
  static String get share_bold => 'assets/icons/share_bold.svg';
  static String get snow => 'assets/icons/snow.svg';
  static String get snow_bold => 'assets/icons/snow_bold.svg';
  static String get sticker => 'assets/icons/sticker.svg';
  static String get sticker_bold => 'assets/icons/sticker_bold.svg';
  static String get sunny => 'assets/icons/sunny.svg';
  static String get sunny_bold => 'assets/icons/sunny_bold.svg';
  static String get thunder => 'assets/icons/thunder.svg';
  static String get thunder_bold => 'assets/icons/thunder_bold.svg';
  static String get trash => 'assets/icons/trash.svg';
  static String get trash_bold => 'assets/icons/trash_bold.svg';
  static String get unlike => 'assets/icons/unlike.svg';
  static String get unlock => 'assets/icons/unlock.svg';
  static String get unlock_bold => 'assets/icons/unlock_bold.svg';
  static String get waterdrop_bold => 'assets/icons/waterdrop_bold.svg';
  static String get write => 'assets/icons/write.svg';
  static String get write_bold => 'assets/icons/write_bold.svg';
}
