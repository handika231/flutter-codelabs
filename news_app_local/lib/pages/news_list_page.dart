import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_local/config/platform_widget.dart';
import 'package:news_app_local/data/news/article.dart';

import 'article_detail_page.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);
  static const routeName = '/news-list';

  @override
  Widget build(BuildContext context) {
    return const PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
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
  return FutureBuilder(
    future: DefaultAssetBundle.of(context).loadString('assets/article.json'),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting ||
          snapshot.data == null) {
        return const CircularProgressIndicator();
      }
      final List<Article> articles = parseArticle(snapshot.data);
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildArticleItem(context, articles[index]);
        },
      );
    },
  );
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return Material(
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        );
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      leading: Image.network(
        '${article.urlToImage}',
        width: 100,
      ),
      title: Text(
        article.title.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(article.author.toString()),
    ),
  );
}
