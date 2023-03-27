class HomeModel {
  HomeModel({
    required this.profileImage,
    required this.backgroundImage,
  });

  String profileImage;
  String backgroundImage;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      profileImage: json['profileImage'] as String,
      backgroundImage: json['backgroundImage'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'profileImage': profileImage,
        'backgroundImage': backgroundImage,
      };
}
