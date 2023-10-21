class PublicRepository {
  static String get baseUrl => "54.214.241.207:8080";

  String getDiaryImageUrl(String image) {
    String url = "http://" + baseUrl + "/image/diary/$image";
    return url;
  }

  String getProfileImageUrl(String image) {
    String url = "http://" + baseUrl + "/image/profile/$image";
    return url;
  }

  String getChallengeImageUrl(String image) {
    String url = "http://" + baseUrl + "/image/challenge/$image";
    return url;
  }

  String getStickerImageUrl(String image) {
    String url = "http://" + baseUrl + "/image/sticker/$image";
    return url;
  }

  String getBrowseImageUrl(String image) {
    String url = "http://" + baseUrl + "/image/browse/$image";
    return url;
  }
}
