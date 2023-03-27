class MyPageModel {
  MyPageModel({
    required this.nickname,
    required this.loginType,
    required this.dogName,
    required this.profileImage,
    required this.breed,
    required this.age,
    required this.gender,
    required this.birth,
  });

  String nickname;
  String loginType;
  String dogName;
  String profileImage;
  String breed;
  String age;
  String gender;
  String birth;

  factory MyPageModel.fromJson(Map<String, dynamic> json) {
    return MyPageModel(
      nickname: json['nickname'] as String,
      loginType: json['loginType'] as String,
      dogName: json['dogName'] as String,
      profileImage: json['profileImage'] as String,
      breed: json['breed'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      birth: json['birth'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'loginType': loginType,
        'dogName': dogName,
        'profileImage': profileImage,
        'breed': breed,
        'age': age,
        'gender': gender,
        'birth': birth,
      };
}
