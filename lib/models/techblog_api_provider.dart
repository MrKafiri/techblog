import 'dart:convert';
import 'package:tec/models/item_model.dart';
import 'package:http/http.dart' as http;

class TechBlogApiProvider {
  static Future<List<ItemModel>> fetchList() async {
    final String host = 'http://192.168.1.6/techblog/test.json';
    final response = await http.get(Uri.parse(host));
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body))
          .map((m) => ItemModel.fromJson(m))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
