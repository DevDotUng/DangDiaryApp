class FAQModel {
  FAQModel({
    required this.FAQId,
    required this.question,
    required this.answer,
    required this.isLike,
  });

  int FAQId;
  String question;
  String answer;
  bool? isLike;

  factory FAQModel.fromJson(Map<String, dynamic> json) {
    return FAQModel(
      FAQId: json['FAQId'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
      isLike: json['isLike'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'FAQId': FAQId,
        'question': question,
        'answer': answer,
        'isLike': isLike,
      };
}
