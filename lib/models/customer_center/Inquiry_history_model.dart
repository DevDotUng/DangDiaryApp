class InquiryHistoryModel {
  InquiryHistoryModel({
    required this.inquiryId,
    required this.registerDate,
    required this.type,
    required this.title,
    required this.content,
    required this.progress,
    required this.answer,
    required this.answerDate,
    required this.isLike,
  });

  int inquiryId;
  String registerDate;
  String type;
  String title;
  String content;
  String progress;
  String? answer;
  String? answerDate;
  bool? isLike;

  factory InquiryHistoryModel.fromJson(Map<String, dynamic> json) {
    return InquiryHistoryModel(
      inquiryId: json['inquiryId'] as int,
      registerDate: json['registerDate'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      progress: json['progress'] as String,
      answer: json['answer'] as String?,
      answerDate: json['answerDate'] as String?,
      isLike: json['isLike'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'inquiryId': inquiryId,
        'registerDate': registerDate,
        'type': type,
        'title': title,
        'content': content,
        'progress': progress,
        'answer': answer,
        'answerDate': answerDate,
        'isLike': isLike,
      };
}
