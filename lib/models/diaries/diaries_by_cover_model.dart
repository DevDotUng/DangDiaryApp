import 'package:dangdiarysample/models/diaries/diary_model.dart';

class DiariesByCoverModel {
  DiariesByCoverModel({
    required this.coverId,
    required this.date,
    required this.coverTitle,
    required this.coverColor,
    required this.holderColor,
    required this.numberOfLike,
    required this.diary,
  });

  int coverId;
  String date;
  String coverTitle;
  String coverColor;
  String holderColor;
  int numberOfLike;
  List<DiaryModel> diary;

  factory DiariesByCoverModel.fromJson(Map<String, dynamic> json) {
    return DiariesByCoverModel(
      coverId: json['coverId'] as int,
      date: json['date'] as String,
      coverTitle: json['coverTitle'] as String,
      coverColor: json['coverColor'] as String,
      holderColor: json['holderColor'] as String,
      numberOfLike: json['numberOfLike'] as int,
      diary: List<DiaryModel>.from(
          json['diary'].map((data) => DiaryModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'coverId': coverId,
        'date': date,
        'coverTitle': coverTitle,
        'coverColor': coverColor,
        'holderColor': holderColor,
        'numberOfLike': numberOfLike,
        'diary': diary,
      };
}
