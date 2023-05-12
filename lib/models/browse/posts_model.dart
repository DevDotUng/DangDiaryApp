class PostsModel {
  PostsModel({
    required this.profileImage,
    required this.dogName,
    required this.userId,
    required this.diaryId,
    required this.challengeId,
    required this.title,
    required this.registerDate,
    required this.weather,
    required this.feeling,
    required this.content,
    required this.stickerImage,
    required this.stickerShape,
    required this.isPublic,
    required this.numberOfLike,
    required this.isLike,
    required this.images,
    required this.tags,
  });

  String profileImage;
  String dogName;
  int userId;
  int diaryId;
  int challengeId;
  String title;
  String registerDate;
  String weather;
  String feeling;
  String content;
  String stickerImage;
  String stickerShape;
  bool isPublic;
  int numberOfLike;
  bool isLike;
  List<String> images;
  List<String> tags;

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      profileImage: json['profileImage'] as String,
      dogName: json['dogName'] as String,
      userId: json['userId'] as int,
      diaryId: json['diaryId'] as int,
      challengeId: json['challengeId'] as int,
      title: json['title'] as String,
      registerDate: json['registerDate'] as String,
      weather: json['weather'] as String,
      feeling: json['feeling'] as String,
      content: json['content'] as String,
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
      isPublic: json['isPublic'] as bool,
      numberOfLike: json['numberOfLike'] as int,
      isLike: json['isLike'] as bool,
      images: List<String>.from(json['images']),
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() => {
        'profileImage': profileImage,
        'dogName': dogName,
        'userId': userId,
        'diaryId': diaryId,
        'challengeId': challengeId,
        'title': title,
        'registerDate': registerDate,
        'weather': weather,
        'feeling': feeling,
        'content': content,
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
        'isPublic': isPublic,
        'numberOfLike': numberOfLike,
        'isLike': isLike,
        'images': images,
        'tags': tags,
      };
}
