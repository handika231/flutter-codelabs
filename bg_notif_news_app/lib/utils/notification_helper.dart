import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app_local/data/model/article_result.dart';
import 'package:news_app_local/routes/navigation.dart';
import 'package:rxdart/rxdart.dart';

final selectNotification = BehaviorSubject<String>();

class NotificationHelper {
  //create singleton
  static final NotificationHelper _instance = NotificationHelper._internal();
  factory NotificationHelper() => _instance;
  NotificationHelper._internal();

  Future initNotification(FlutterLocalNotificationsPlugin notification) async {
    var initAndroid = const AndroidInitializationSettings('app_icon');
    var initIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initPlatform =
        InitializationSettings(android: initAndroid, iOS: initIOS);
    await notification.initialize(initPlatform,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        print('notification payload: $payload');
      }
      selectNotification.add(payload ?? "Empty Payload");
    });
  }

  Future showNotification(
    FlutterLocalNotificationsPlugin notification,
    ArticlesResult article,
  ) async {
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "dicoding news channel";
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true));

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var titleNotification = "<b>Headline News</b>";
    var titleNews = article.articles[0].title;
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await notification.show(
      0,
      titleNotification,
      titleNews,
      platformChannelSpecifics,
      payload: json.encode(
        article.toJson(),
      ),
    );
  }

  configureNotificationSubject(
    String route,
  ) {
    selectNotification.stream.listen((String payload) async {
      var data = ArticlesResult.fromJson(json.decode(payload));
      var article = data.articles[0];
      Navigation.intentWithData(route, article);
    });
  }
}
