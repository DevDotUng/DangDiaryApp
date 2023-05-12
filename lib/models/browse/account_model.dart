class AccountModel {
  AccountModel({
    required this.dogName,
    required this.nickname,
  });

  String dogName;
  String nickname;

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      dogName: json['dogName'] as String,
      nickname: json['nickname'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'dogName': dogName,
        'nickname': nickname,
      };
}
