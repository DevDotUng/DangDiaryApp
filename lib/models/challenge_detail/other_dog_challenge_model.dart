class OtherDogChallengeModel {
  OtherDogChallengeModel({
    required this.diaryId,
    required this.image,
  });

  int diaryId;
  String image;

  factory OtherDogChallengeModel.fromJson(Map<String, dynamic> json) {
    return OtherDogChallengeModel(
      diaryId: json['diaryId'] as int,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'image': image,
      };
}
