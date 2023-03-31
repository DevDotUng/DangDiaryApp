class DiaryByStickerModel {
  DiaryByStickerModel({
    required this.diaryId,
    required this.endDate,
    required this.diaryTitle,
    required this.numberOfLike,
    required this.coverColor,
  });

  int diaryId;
  String endDate;
  String diaryTitle;
  int numberOfLike;
  String coverColor;

  factory DiaryByStickerModel.fromJson(Map<String, dynamic> json) {
    return DiaryByStickerModel(
      diaryId: json['diaryId'] as int,
      endDate: json['endDate'] as String,
      diaryTitle: json['diaryTitle'] as String,
      numberOfLike: json['numberOfLike'] as int,
      coverColor: json['coverColor'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'endDate': endDate,
        'diaryTitle': diaryTitle,
        'numberOfLike': numberOfLike,
        'coverColor': coverColor,
      };
}
