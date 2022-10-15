class ImageModel {
  late int id;
  late String title;
  late String url;

  ImageModel(this.id, this.title, this.url);

  ImageModel.fromJson(Map<String, dynamic> parseJson) {
    id = parseJson['id'];
    url = parseJson['url'];
    title = parseJson['title'];
  }
}
