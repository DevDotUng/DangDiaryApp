class NotificationModel {
  NotificationModel({
    required this.id,
    required this.userId,
    required this.registerDate,
    required this.type,
    required this.content,
    required this.coverId,
    required this.diaryId,
  });

  int id;
  int userId;
  String registerDate;
  String type;
  String content;
  int? coverId;
  int? diaryId;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      registerDate: json['registerDate'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      coverId: json['coverId'] as int?,
      diaryId: json['diaryId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'registerDate': registerDate,
        'type': type,
        'content': content,
        'coverId': coverId,
        'diaryId': diaryId,
      };
}
