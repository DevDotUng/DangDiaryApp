class OverdueDiaryModel {
  OverdueDiaryModel({
    required this.diaryId,
    required this.userId,
    required this.challengeId,
    required this.endDate,
    required this.weather,
    required this.feeling,
    required this.title,
    required this.content,
    required this.isPublic,
    required this.tags,
  });

  int diaryId;
  int userId;
  int challengeId;
  String endDate;
  String? weather;
  String? feeling;
  String? title;
  String? content;
  bool isPublic;
  List<String> tags;

  factory OverdueDiaryModel.fromJson(Map<String, dynamic> json) {
    return OverdueDiaryModel(
      diaryId: json['diaryId'] as int,
      userId: json['userId'] as int,
      challengeId: json['challengeId'] as int,
      endDate: json['endDate'] as String,
      weather: json['weather'] as String?,
      feeling: json['feeling'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      isPublic: json['isPublic'] as bool,
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'userId': userId,
        'challengeId': challengeId,
        'endDate': endDate,
        'weather': weather,
        'feeling': feeling,
        'title': title,
        'content': content,
        'isPublic': isPublic,
        'tags': tags,
      };
}
