class ReportHistoryModel {
  ReportHistoryModel({
    required this.reportId,
    required this.userId,
    required this.diaryId,
    required this.status,
    required this.title,
    required this.reason,
    required this.answer,
    required this.createDate,
    required this.modifyDate,
  });

  int reportId;
  int userId;
  int diaryId;
  String status;
  String title;
  String reason;
  String? answer;
  String? createDate;
  String? modifyDate;

  factory ReportHistoryModel.fromJson(Map<String, dynamic> json) {
    return ReportHistoryModel(
      reportId: json['reportId'] as int,
      userId: json['userId'] as int,
      diaryId: json['diaryId'] as int,
      status: json['status'] as String,
      title: json['title'] as String,
      reason: json['reason'] as String,
      answer: json['answer'] as String?,
      createDate: json['createDate'] as String?,
      modifyDate: json['modifyDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'reportId': reportId,
        'userId': userId,
        'diaryId': diaryId,
        'status': status,
        'title': title,
        'reason': reason,
        'answer': answer,
        'createDate': createDate,
        'modifyDate': modifyDate,
      };
}
