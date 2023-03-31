class CompleteDiaryModel {
  CompleteDiaryModel({
    required this.diaryId,
    required this.userId,
    required this.challengeId,
    required this.title,
    required this.endDate,
    required this.weather,
    required this.feeling,
    required this.content,
    required this.hit,
    required this.isPublic,
    required this.images,
    required this.tags,
    required this.dogName,
    required this.stickerImage,
    required this.stickerShape,
  });

  int diaryId;
  int userId;
  int challengeId;
  String title;
  String endDate;
  String weather;
  String feeling;
  String content;
  int hit;
  bool isPublic;
  List<String> images;
  List<String> tags;
  String dogName;
  String stickerImage;
  String stickerShape;

  factory CompleteDiaryModel.fromJson(Map<String, dynamic> json) {
    return CompleteDiaryModel(
      diaryId: json['diaryId'] as int,
      userId: json['userId'] as int,
      challengeId: json['challengeId'] as int,
      title: json['title'] as String,
      endDate: json['endDate'] as String,
      weather: json['weather'] as String,
      feeling: json['feeling'] as String,
      content: json['content'] as String,
      hit: json['hit'] as int,
      isPublic: json['isPublic'] as bool,
      images: List<String>.from(json['images']),
      tags: List<String>.from(json['tags']),
      dogName: json['dogName'] as String,
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'userId': userId,
        'challengeId': challengeId,
        'title': title,
        'endDate': endDate,
        'weather': weather,
        'feeling': feeling,
        'content': content,
        'hit': hit,
        'isPublic': isPublic,
        'images': images,
        'tags': tags,
        'dogName': dogName,
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
      };
}
