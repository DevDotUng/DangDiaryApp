import 'package:dangdiarysample/models/browse/account_model.dart';

class SearchPostsResultModel {
  SearchPostsResultModel({
    required this.hashTags,
    required this.accounts,
    required this.breeds,
  });

  List<String> hashTags;
  List<AccountModel> accounts;
  List<String> breeds;

  factory SearchPostsResultModel.fromJson(Map<String, dynamic> json) {
    return SearchPostsResultModel(
      hashTags: List<String>.from(json['hashTags']),
      accounts: List<AccountModel>.from(
          json['accounts'].map((data) => AccountModel.fromJson(data))),
      breeds: List<String>.from(json['breeds']),
    );
  }

  Map<String, dynamic> toJson() => {
        'hashTags': hashTags,
        'accounts': accounts,
        'breeds': breeds,
      };
}
