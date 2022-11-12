import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WriteDiaryController extends GetxController {
  static WriteDiaryController get to => Get.find();
  RxString date = DateFormat('yyyy.MM.dd').format(DateTime.now()).obs;
  final ImagePicker _picker = ImagePicker();
  RxList images = [].obs;

  void changeDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy.MM.dd').format(pickedDate);
      date(formattedDate);
    } else {}
  }

  void pickImages() async {
    final List<XFile>? imageList = await _picker.pickMultiImage();
    images(imageList);
  }
}
