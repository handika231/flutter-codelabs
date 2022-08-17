import 'package:flutter/material.dart';
import 'package:news_app_local/widgets/custom_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  final String url;
  const ArticleWebView({Key? key, required this.url}) : super(key: key);
  static const routeName = '/article_web_view';
  @override
  Widget build(BuildContext context) {
    return CustomWidget(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
