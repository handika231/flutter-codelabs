import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'source.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  factory Article({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

List<Article> parseArticle(String body) {
  if (json == null) return [];
  final List parsed = jsonDecode(body)['articles'];
  return parsed.map((json) => Article.fromJson(json)).toList();
}
