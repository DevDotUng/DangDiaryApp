class LockedStickerModel {
  LockedStickerModel({
    required this.challengeId,
    required this.stickerImage,
    required this.stickerShape,
  });

  int challengeId;
  String stickerImage;
  String stickerShape;

  factory LockedStickerModel.fromJson(Map<String, dynamic> json) {
    return LockedStickerModel(
      challengeId: json['challengeId'] as int,
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'challengeId': challengeId,
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
      };
}
