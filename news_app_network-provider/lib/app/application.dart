import 'package:flutter/material.dart';
import 'package:news_app_local/data/model/article_result.dart';
import 'package:news_app_local/pages/article_web_view.dart';
import 'package:news_app_local/pages/home_page.dart';
import 'package:news_app_local/style/style.dart';

import '../pages/article_detail_page.dart';
import '../pages/news_list_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News List App',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        NewsListPage.routeName: (context) => const NewsListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context)?.settings.arguments as Article,
            ),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
    );
  }
}
