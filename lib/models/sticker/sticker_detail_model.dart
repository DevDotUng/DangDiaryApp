import 'package:dangdiarysample/models/sticker/diary_by_sticker_model.dart';

class StickerDetailModel {
  StickerDetailModel({
    required this.stickerImage,
    required this.stickerShape,
    required this.challengeTitle,
    required this.numberOfSticker,
    required this.firstGetDate,
    required this.recentGetDate,
    required this.diaryBySticker,
  });

  String stickerImage;
  String stickerShape;
  String challengeTitle;
  int numberOfSticker;
  String firstGetDate;
  String recentGetDate;
  List<DiaryByStickerModel> diaryBySticker;

  factory StickerDetailModel.fromJson(Map<String, dynamic> json) {
    return StickerDetailModel(
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
      challengeTitle: json['challengeTitle'] as String,
      numberOfSticker: json['numberOfSticker'] as int,
      firstGetDate: json['firstGetDate'] as String,
      recentGetDate: json['recentGetDate'] as String,
      diaryBySticker: List<DiaryByStickerModel>.from(json['diaryBySticker']
          .map((data) => DiaryByStickerModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
        'challengeTitle': challengeTitle,
        'numberOfSticker': numberOfSticker,
        'firstGetDate': firstGetDate,
        'recentGetDate': recentGetDate,
        'diaryBySticker': diaryBySticker,
      };
}
