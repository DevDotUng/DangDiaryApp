class DiaryModel {
  DiaryModel({
    required this.diaryId,
    required this.endDate,
    required this.image,
    required this.numberOfLike,
    required this.isLike,
  });

  int diaryId;
  String endDate;
  String image;
  int numberOfLike;
  bool isLike;

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return DiaryModel(
      diaryId: json['diaryId'] as int,
      endDate: json['endDate'] as String,
      image: json['image'] as String,
      numberOfLike: json['numberOfLike'] as int,
      isLike: json['isLike'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'endDate': endDate,
        'image': image,
        'numberOfLike': numberOfLike,
        'isLike': isLike,
      };
}
