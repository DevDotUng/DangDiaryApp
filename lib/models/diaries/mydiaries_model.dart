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
    required this.autoCompleteWords,
  });

  String dogName;
  String? profileImage;
  int date;
  int numberOfDiary;
  int numberOfOverdueDiary;
  int numberOfSticker;
  List<DiariesByCoverModel> diaries;
  List<String> autoCompleteWords;

  factory MyDiariesModel.fromJson(Map<String, dynamic> json) {
    return MyDiariesModel(
      dogName: json['dogName'] as String,
      profileImage: json['profileImage'] as String?,
      date: json['date'] as int,
      numberOfDiary: json['numberOfDiary'] as int,
      numberOfOverdueDiary: json['numberOfOverdueDiary'] as int,
      numberOfSticker: json['numberOfSticker'] as int,
      diaries: List<DiariesByCoverModel>.from(
          json['diaries'].map((data) => DiariesByCoverModel.fromJson(data))),
      autoCompleteWords: List<String>.from(json['autoCompleteWords']),
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
        'autoCompleteWords': autoCompleteWords,
      };
}
