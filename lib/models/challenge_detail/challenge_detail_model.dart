import 'package:dangdiarysample/models/challenge_detail/other_dog_challenge_model.dart';

class ChallengeDetailModel {
  ChallengeDetailModel({
    required this.isChallenge,
    required this.image,
    required this.title,
    required this.content,
    required this.authenticationMethod,
    required this.stickerImage,
    required this.stickerShape,
    required this.numberOfComplete,
    required this.recommendDate,
    required this.otherDogChallenges,
  });

  bool isChallenge;
  String image;
  String title;
  String content;
  String authenticationMethod;
  String stickerImage;
  String stickerShape;
  int numberOfComplete;
  String recommendDate;
  List<OtherDogChallengeModel> otherDogChallenges;

  factory ChallengeDetailModel.fromJson(Map<String, dynamic> json) {
    return ChallengeDetailModel(
      isChallenge: json['isChallenge'] as bool,
      image: json['image'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      authenticationMethod: json['authenticationMethod'] as String,
      stickerImage: json['stickerImage'] as String,
      stickerShape: json['stickerShape'] as String,
      numberOfComplete: json['numberOfComplete'] as int,
      recommendDate: json['recommendDate'] as String,
      otherDogChallenges: List<OtherDogChallengeModel>.from(
          json['otherDogChallenges']
              .map((data) => OtherDogChallengeModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'isChallenge': isChallenge,
        'image': image,
        'title': title,
        'content': content,
        'authenticationMethod': authenticationMethod,
        'stickerImage': stickerImage,
        'stickerShape': stickerShape,
        'numberOfComplete': numberOfComplete,
        'recommendDate': recommendDate,
        'otherDogChallenges': otherDogChallenges,
      };
}
