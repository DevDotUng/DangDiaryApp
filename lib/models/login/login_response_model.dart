class LoginResponseModel {
  LoginResponseModel({
    required this.userId,
    required this.name,
    required this.admissionDate,
    required this.existDog,
  });

  int userId;
  String name;
  String admissionDate;
  bool existDog;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      userId: json['userId'] as int,
      name: json['name'] as String,
      admissionDate: json['admissionDate'] as String,
      existDog: json['existDog'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'admissionDate': admissionDate,
        'existDog': existDog,
      };
}
