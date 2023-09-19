class AgreeModel {
  AgreeModel({
    required this.userId,
    required this.agreeLikeNotification,
    required this.agreeChallengeNotification,
  });

  int userId;
  bool agreeLikeNotification;
  bool agreeChallengeNotification;

  factory AgreeModel.fromJson(Map<String, dynamic> json) {
    return AgreeModel(
      userId: json['userId'] as int,
      agreeLikeNotification: json['agreeLikeNotification'] as bool,
      agreeChallengeNotification: json['agreeChallengeNotification'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'agreeLikeNotification': agreeLikeNotification,
        'agreeChallengeNotification': agreeChallengeNotification,
      };
}
