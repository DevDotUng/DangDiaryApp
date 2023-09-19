class DiaryByStickerModel {
  DiaryByStickerModel({
    required this.coverId,
    required this.diaryId,
    required this.endDate,
    required this.diaryTitle,
    required this.numberOfLike,
    required this.coverColor,
  });

  int coverId;
  int diaryId;
  String endDate;
  String diaryTitle;
  int numberOfLike;
  String? coverColor;

  factory DiaryByStickerModel.fromJson(Map<String, dynamic> json) {
    return DiaryByStickerModel(
      coverId: json['coverId'] as int,
      diaryId: json['diaryId'] as int,
      endDate: json['endDate'] as String,
      diaryTitle: json['diaryTitle'] as String,
      numberOfLike: json['numberOfLike'] as int,
      coverColor: json['coverColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'coverId': coverId,
        'diaryId': diaryId,
        'endDate': endDate,
        'diaryTitle': diaryTitle,
        'numberOfLike': numberOfLike,
        'coverColor': coverColor,
      };
}
