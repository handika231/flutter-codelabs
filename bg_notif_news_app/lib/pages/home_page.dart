import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_local/config/platform_widget.dart';
import 'package:news_app_local/data/api/api_service.dart';
import 'package:news_app_local/pages/article_detail_page.dart';
import 'package:news_app_local/provider/news_provider.dart';
import 'package:news_app_local/provider/schedule_provider.dart';
import 'package:provider/provider.dart';

import '../utils/notification_helper.dart';
import 'news_list_page.dart';
import 'setting_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;
  static const String _headlineText = 'Headline';
  final NotificationHelper _notificationHelper = NotificationHelper();
  final List<Widget> _listWidget = [
    ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(service: ApiService()),
      child: const NewsListPage(),
    ),
    ChangeNotifierProvider<SchedulingProvider>(
      create: (context) => SchedulingProvider(),
      child: const SettingPage(),
    ),
  ];
  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: _headlineText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: SettingPage.routeName,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureNotificationSubject(ArticleDetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotification.close();
    super.dispose();
  }

  _onBottomNavTap(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavItems,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _listWidget[index];
          },
        );
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: _bottomNavItems,
        onTap: _onBottomNavTap,
        currentIndex: bottomNavIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
