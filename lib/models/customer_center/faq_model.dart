class FAQModel {
  FAQModel({
    required this.FAQId,
    required this.question,
    required this.answer,
  });

  int FAQId;
  String question;
  String answer;

  factory FAQModel.fromJson(Map<String, dynamic> json) {
    return FAQModel(
      FAQId: json['FAQId'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'FAQId': FAQId,
        'question': question,
        'answer': answer,
      };
}
