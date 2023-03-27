import 'package:dangdiarysample/models/challenge/recommend_challenge_model.dart';

class ChallengeModel {
  ChallengeModel({
    required this.recommendChallenges,
    required this.inProgressChallenges,
  });

  List<RecommendChallengeModel> recommendChallenges;
  List<RecommendChallengeModel> inProgressChallenges;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      recommendChallenges: List<RecommendChallengeModel>.from(
          json['recommendChallenges']
              .map((data) => RecommendChallengeModel.fromJson(data))),
      inProgressChallenges: List<RecommendChallengeModel>.from(
          json['inProgressChallenges']
              .map((data) => RecommendChallengeModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'recommendChallenges': recommendChallenges,
        'inProgressChallenges': inProgressChallenges,
      };
}
