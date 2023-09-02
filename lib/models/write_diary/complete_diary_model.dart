class CompleteDiaryModel {
  CompleteDiaryModel({
    required this.coverId,
    required this.diaryId,
  });

  int coverId;
  int diaryId;

  factory CompleteDiaryModel.fromJson(Map<String, dynamic> json) {
    return CompleteDiaryModel(
      coverId: json['coverId'] as int,
      diaryId: json['diaryId'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'coverId': coverId,
        'diaryId': diaryId,
      };
}
