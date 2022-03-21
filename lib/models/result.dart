class Result {
  String? id;
  String? title;
  dynamic content;
  String? writer;
  List? tags;
  String? date;
  String? like;
  String? views;
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
    date = parsedJson['date'];
    like = parsedJson['like'];
    views = parsedJson['views'];
  }
}

class CategoryResult {
  String? id;
  String? title;
  CategoryResult({this.id, this.title});
  CategoryResult.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
  }
}
