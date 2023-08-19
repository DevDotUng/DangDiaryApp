import 'package:dangdiarysample/models/diary/mydiary_model.dart';

class DiaryWithCoverModel {
  DiaryWithCoverModel({
    required this.coverId,
    required this.date,
    required this.coverTitle,
    required this.coverColor,
    required this.holderColor,
    required this.numberOfLike,
    required this.diaries,
  });

  int coverId;
  String date;
  String coverTitle;
  String coverColor;
  String holderColor;
  int numberOfLike;
  List<MyDiaryModel> diaries;

  factory DiaryWithCoverModel.fromJson(Map<String, dynamic> json) {
    return DiaryWithCoverModel(
      coverId: json['coverId'] as int,
      date: json['date'] as String,
      coverTitle: json['coverTitle'] as String,
      coverColor: json['coverColor'] as String,
      holderColor: json['holderColor'] as String,
      numberOfLike: json['numberOfLike'] as int,
      diaries: List<MyDiaryModel>.from(
          json['diaries'].map((data) => MyDiaryModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'coverId': coverId,
        'date': date,
        'coverTitle': coverTitle,
        'coverColor': coverColor,
        'holderColor': holderColor,
        'numberOfLike': numberOfLike,
        'diaries': diaries,
      };
}
