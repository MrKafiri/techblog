import 'package:tec/models/result.dart';

class ItemModel {
  String? _type;
  String? _title;
  String? _color;
  String? _icon;
  List<Result> _results = [];
  List<CategoryResult> _resultCategory = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _type = parsedJson['type'];
    if (parsedJson['type'] == "list") {
      _title = parsedJson['title'];
      _color = parsedJson['color'];
      _icon = parsedJson['icon'];
      _results = List.from(parsedJson['items'])
          .map(
            (r) => Result.fromJson(r),
          )
          .toList();
    } else if (parsedJson['type'] == "header") {
      _results = List.from(parsedJson['items'])
          .map(
            (r) => Result.fromJson(r),
          )
          .toList();
    } else if (parsedJson['type'] == "category") {
      _resultCategory = List.from(parsedJson['items'])
          .map(
            (r) => CategoryResult.fromJson(r),
          )
          .toList();
    }
  }

  List<Result> get results => _results;
  List<CategoryResult> get resultCategory => _resultCategory;
  String? get type => _type;
  String? get title => _title;
  String? get color => _color;
  String? get icon => _icon;
}
