import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
	factory News({
		List<Article>? articles,
	}) = _News;

	factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}