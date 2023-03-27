class MyStickerModel {
  MyStickerModel({
    required this.challengeId,
    required this.stickerImage,
    required this.stickerShape,
    required this.challengeTitle,
    required this.recentGetDate,
  });

  int challengeId;
  String stickerImage;
  String stickerShape;
  String challengeTitle;
  String recentGetDate;

  factory MyStickerModel.fromJson(Map<String, dynamic> json) {
    return MyStickerModel(
      challengeId: json['challengeId'] as int,
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
      challengeTitle: json['challengeTitle'] as String,
      recentGetDate: json['recentGetDate'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'challengeId': challengeId,
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
        'challengeTitle': challengeTitle,
        'recentGetDate': recentGetDate,
      };
}
