import 'package:dangdiarysample/models/challenge/recommend_challenge_model.dart';

class ChallengeModel {
  ChallengeModel({
    required this.recommendChallenges,
    required this.inProgressChallenges,
    required this.overdueChallenges,
  });

  List<RecommendChallengeModel> recommendChallenges;
  List<RecommendChallengeModel> inProgressChallenges;
  List<RecommendChallengeModel> overdueChallenges;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      recommendChallenges: List<RecommendChallengeModel>.from(
          json['recommendChallenges']
              .map((data) => RecommendChallengeModel.fromJson(data))),
      inProgressChallenges: List<RecommendChallengeModel>.from(
          json['inProgressChallenges']
              .map((data) => RecommendChallengeModel.fromJson(data))),
      overdueChallenges: List<RecommendChallengeModel>.from(
          json['overdueChallenges']
              .map((data) => RecommendChallengeModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'recommendChallenges': recommendChallenges,
        'inProgressChallenges': inProgressChallenges,
        'overdueChallenges': overdueChallenges,
      };
}
