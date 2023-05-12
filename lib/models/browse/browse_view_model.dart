import 'package:dangdiarysample/models/browse/browse_model.dart';

class BrowseViewModel {
  BrowseViewModel({
    required this.autoCompleteWords,
    required this.browses,
  });

  List<String> autoCompleteWords;
  List<BrowseModel> browses;

  factory BrowseViewModel.fromJson(Map<String, dynamic> json) {
    return BrowseViewModel(
      autoCompleteWords: List<String>.from(json['autoCompleteWords']),
      browses: List<BrowseModel>.from(
          json['browses'].map((data) => BrowseModel.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() => {
        'autoCompleteWords': autoCompleteWords,
        'browses': browses,
      };
}
