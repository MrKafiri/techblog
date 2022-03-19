class Result {
  String? id;
  String? title;
  String? content;
  String? writer;
  List? tags;
  String? imgUrl;
  bool? isPodcast;

  Result(
      {this.id, this.title, this.content, this.writer, this.tags, this.imgUrl});

  Result.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    content = parsedJson['content'];
    writer = parsedJson['writer'];
    tags = List.from(parsedJson['tags']).map((tag) => tag.toString()).toList();
    imgUrl = parsedJson['imgUri'];
    isPodcast = parsedJson['isPodcast'] == "0" ? false : true;
  }
}
