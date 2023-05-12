class BrowseModel {
  BrowseModel({
    required this.browseId,
    required this.title,
    required this.content,
    required this.image,
    required this.query,
  });

  int browseId;
  String title;
  String content;
  String image;
  String query;

  factory BrowseModel.fromJson(Map<String, dynamic> json) {
    return BrowseModel(
      browseId: json['browseId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      query: json['query'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'browseId': browseId,
        'title': title,
        'content': content,
        'image': image,
        'query': query,
      };
}
