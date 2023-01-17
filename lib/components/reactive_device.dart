import 'dart:io';

import 'package:flutter/material.dart';

class ReactiveDevice {
  bool hasHomeIndicator(BuildContext context) {
    return Platform.isIOS && MediaQuery.of(context).size.height >= 810;
  }
}
