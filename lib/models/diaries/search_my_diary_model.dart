class SearchMyDiaryModel {
  SearchMyDiaryModel({
    required this.diaryId,
    required this.endDate,
    required this.diaryTitle,
    required this.numberOfLike,
    required this.coverId,
    required this.coverColor,
  });

  int diaryId;
  String endDate;
  String diaryTitle;
  int numberOfLike;
  int coverId;
  String? coverColor;

  factory SearchMyDiaryModel.fromJson(Map<String, dynamic> json) {
    return SearchMyDiaryModel(
      diaryId: json['diaryId'] as int,
      endDate: json['endDate'] as String,
      diaryTitle: json['diaryTitle'] as String,
      numberOfLike: json['numberOfLike'] as int,
      coverId: json['coverId'] as int,
      coverColor: json['coverColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'endDate': endDate,
        'diaryTitle': diaryTitle,
        'numberOfLike': numberOfLike,
        'coverId': coverId,
        'coverColor': coverColor,
      };
}
