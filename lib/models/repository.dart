import 'package:tec/models/item_model.dart';
import 'package:tec/models/techblog_api_provider.dart';

class Repository {
  final ApiProvider = TechBlogApiProvider();
  static Future<List<ItemModel>> fetchAll() => TechBlogApiProvider.fetchList();
}
