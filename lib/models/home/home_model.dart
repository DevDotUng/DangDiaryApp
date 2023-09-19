import 'package:dangdiarysample/models/home/notification_model.dart';

class HomeModel {
  HomeModel({
    required this.profileImage,
    required this.backgroundImage,
    required this.notifications,
  });

  String? profileImage;
  String backgroundImage;
  List<NotificationModel> notifications;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      profileImage: json['profileImage'] as String?,
      backgroundImage: json['backgroundImage'] as String,
      notifications: List<NotificationModel>.from(json['notifications']
          .map((data) => NotificationModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'profileImage': profileImage,
        'backgroundImage': backgroundImage,
        'notifications': notifications,
      };
}
