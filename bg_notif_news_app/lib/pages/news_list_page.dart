import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_local/config/platform_widget.dart';
import 'package:news_app_local/provider/news_provider.dart';
import 'package:provider/provider.dart';

import '../data/model/article_result.dart';
import '../widgets/card_article.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);
  static const routeName = '/news-list';

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        centerTitle: true,
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const CircularProgressIndicator();
        } else {
          if (state.state == ResultState.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.articles.length,
              itemBuilder: (BuildContext context, int index) {
                Article article = state.result.articles[index];
                return CardArticle(article: article);
              },
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Material(child: Text(''));
          }
        }
      },
    );
  }
}
