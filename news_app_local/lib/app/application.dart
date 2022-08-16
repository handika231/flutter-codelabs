import 'package:flutter/material.dart';

import '../data/news/article.dart';
import '../pages/article_detail_page.dart';
import '../pages/news_list.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News List App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      routes: {
        NewsList.routeName: (context) => const NewsList(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: NewsList.routeName,
    );
  }
}
