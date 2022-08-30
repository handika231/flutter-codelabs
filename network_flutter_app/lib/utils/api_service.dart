import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_flutter_app/model/album.dart';

class ApiService {
  static Future<Album> fetchAlbum() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
      if (response.statusCode == 200) {
        return Album.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
