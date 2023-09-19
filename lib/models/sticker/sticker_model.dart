import 'package:dangdiarysample/models/sticker/locked_sticker_model.dart';
import 'package:dangdiarysample/models/sticker/my_sticker_model.dart';

class StickerModel {
  StickerModel({
    required this.numberOfTotalSticker,
    required this.profileImage,
    required this.numberOfSticker,
    required this.numberOfDiary,
    required this.numberOfOverdueDiary,
    required this.myStickers,
    required this.lockedStickers,
  });

  int numberOfTotalSticker;
  String? profileImage;
  int numberOfSticker;
  int numberOfDiary;
  int numberOfOverdueDiary;
  List<MyStickerModel> myStickers;
  List<LockedStickerModel> lockedStickers;

  factory StickerModel.fromJson(Map<String, dynamic> json) {
    return StickerModel(
      numberOfTotalSticker: json['numberOfTotalSticker'] as int,
      profileImage: json['profileImage'] as String?,
      numberOfSticker: json['numberOfSticker'] as int,
      numberOfDiary: json['numberOfDiary'] as int,
      numberOfOverdueDiary: json['numberOfOverdueDiary'] as int,
      myStickers: List<MyStickerModel>.from(
          json['myStickers'].map((data) => MyStickerModel.fromJson(data))),
      lockedStickers: List<LockedStickerModel>.from(json['lockedStickers']
          .map((data) => LockedStickerModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'numberOfTotalSticker': numberOfTotalSticker,
        'profileImage': profileImage,
        'numberOfSticker': numberOfSticker,
        'numberOfDiary': numberOfDiary,
        'numberOfOverdueDiary': numberOfOverdueDiary,
        'myStickers': myStickers,
        'lockedStickers': lockedStickers,
      };
}
