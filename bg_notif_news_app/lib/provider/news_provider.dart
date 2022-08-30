import 'package:flutter/material.dart';
import 'package:news_app_local/data/api/api_service.dart';
import 'package:news_app_local/data/model/article_result.dart';

enum ResultState {
  loading,
  hasData,
  noData,
  error,
}

class NewsProvider extends ChangeNotifier {
  final ApiService service;
  NewsProvider({required this.service}) {
    _fetchAllArticles();
  }
  late ArticlesResult _articlesResult;
  late ResultState _state;
  String _message = '';
  ArticlesResult get result => _articlesResult;
  String get message => _message;
  ResultState get state => _state;

  Future<dynamic> _fetchAllArticles() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final data = await service.getArticle();
      if (data.articles.isEmpty) {
        //CHECK LIST
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articlesResult = data;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }
}
