class RecommendChallengeModel {
  RecommendChallengeModel({
    required this.challengeId,
    required this.title,
    required this.content,
    required this.image,
    required this.recommendDate,
    required this.recommendType,
  });

  int challengeId;
  String title;
  String content;
  String image;
  String? recommendDate;
  String? recommendType;

  factory RecommendChallengeModel.fromJson(Map<String, dynamic> json) {
    return RecommendChallengeModel(
      challengeId: json['challengeId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      recommendDate: json['recommendDate'] as String?,
      recommendType: json['recommendType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'challengeId': challengeId,
        'title': title,
        'content': content,
        'image': image,
        'recommendDate': recommendDate,
        'recommendType': recommendType,
      };
}
