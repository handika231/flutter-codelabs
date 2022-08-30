import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_local/data/model/article_result.dart';

class ApiService {
  Future<ArticlesResult> getArticle() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=5bb6356070d84ff2a0617ff0296c8384');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load article');
    }
  }
}
