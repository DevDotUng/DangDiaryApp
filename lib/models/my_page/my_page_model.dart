class MyPageModel {
  MyPageModel({
    required this.nickname,
    required this.loginType,
    required this.email,
    required this.dogName,
    required this.profileImage,
    required this.breed,
    required this.age,
    required this.gender,
    required this.birth,
    required this.agreeLikeNotification,
    required this.agreeChallengeNotification,
  });

  String nickname;
  String loginType;
  String? email;
  String dogName;
  String? profileImage;
  String breed;
  String age;
  String gender;
  String birth;
  bool agreeLikeNotification;
  bool agreeChallengeNotification;

  factory MyPageModel.fromJson(Map<String, dynamic> json) {
    return MyPageModel(
      nickname: json['nickname'] as String,
      loginType: json['loginType'] as String,
      email: json['email'] as String?,
      dogName: json['dogName'] as String,
      profileImage: json['profileImage'] as String?,
      breed: json['breed'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
      birth: json['birth'] as String,
      agreeLikeNotification: json['agreeLikeNotification'] as bool,
      agreeChallengeNotification: json['agreeChallengeNotification'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'loginType': loginType,
        'email': email,
        'dogName': dogName,
        'profileImage': profileImage,
        'breed': breed,
        'age': age,
        'gender': gender,
        'birth': birth,
        'agreeLikeNotification': agreeLikeNotification,
        'agreeChallengeNotification': agreeChallengeNotification,
      };
}
