import 'dart:convert';

import 'package:di_app/domain/model/cat_image.dart';
import 'package:http/http.dart' as http;

class CatRepository {
  final http.Client httpClient;
  CatRepository(this.httpClient);
  Future<CatImage> getCatImage() async {
    final http.Response response = await httpClient
        .get(Uri.parse('https://api.thecatapi.com/v1/images/search'));
    if (response.statusCode == 200) {
      return CatImage.fromJson(json.decode(response.body)[0]);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
