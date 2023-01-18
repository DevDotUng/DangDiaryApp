import 'dart:io';

import 'package:get/get.dart';

class ReactiveDevice {
  bool hasHomeIndicator() {
    return Platform.isIOS && Get.height >= 810;
  }
}
