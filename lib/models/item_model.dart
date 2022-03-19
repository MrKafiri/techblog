import 'package:tec/models/result.dart';

class ItemModel {
  String? _title;
  String? _color;
  String? _icon;
  bool? _isHeader;
  String? _query;
  List<Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _title = parsedJson['title'];
    _color = parsedJson['color'];
    _icon = parsedJson['icon'];
    _isHeader = parsedJson['isHeader'] == 0 ? false : true;
    _query = parsedJson['query'];
    _results = List.from(parsedJson['items'])
        .map(
          (r) => Result.fromJson(r),
        )
        .toList();
  }

  List<Result> get results => _results;
  String? get title => _title;
  String? get color => _color;
  String? get icon => _icon;
  bool? get isHeader => _isHeader;
  String? get query => _query;
}
