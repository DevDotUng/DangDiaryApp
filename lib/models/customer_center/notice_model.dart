class NoticeModel {
  NoticeModel({
    required this.noticeId,
    required this.title,
    required this.content,
    required this.registerDate,
  });

  int noticeId;
  String title;
  String content;
  String registerDate;

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      noticeId: json['noticeId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      registerDate: json['registerDate'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'noticeId': noticeId,
        'title': title,
        'content': content,
        'registerDate': registerDate,
      };
}
