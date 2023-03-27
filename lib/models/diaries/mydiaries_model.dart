import 'package:dangdiarysample/models/diaries/diaries_by_cover_model.dart';

class MyDiariesModel {
  MyDiariesModel({
    required this.dogName,
    required this.profileImage,
    required this.date,
    required this.numberOfDiary,
    required this.numberOfOverdueDiary,
    required this.numberOfSticker,
    required this.diaries,
  });

  String dogName;
  String profileImage;
  int date;
  int numberOfDiary;
  int numberOfOverdueDiary;
  int numberOfSticker;
  List<DiariesByCoverModel> diaries;

  factory MyDiariesModel.fromJson(Map<String, dynamic> json) {
    return MyDiariesModel(
      dogName: json['dogName'] as String,
      profileImage: json['profileImage'] as String,
      date: json['date'] as int,
      numberOfDiary: json['numberOfDiary'] as int,
      numberOfOverdueDiary: json['numberOfOverdueDiary'] as int,
      numberOfSticker: json['numberOfSticker'] as int,
      diaries: List<DiariesByCoverModel>.from(
          json['diaries'].map((data) => DiariesByCoverModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'dogName': dogName,
        'profileImage': profileImage,
        'date': date,
        'numberOfDiary': numberOfDiary,
        'numberOfOverdueDiary': numberOfOverdueDiary,
        'numberOfSticker': numberOfSticker,
        'diaries': diaries,
      };
}
