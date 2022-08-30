import 'dart:isolate';
import 'dart:ui';

import 'package:news_app_local/data/api/api_service.dart';
import 'package:news_app_local/main.dart';
import 'package:news_app_local/utils/notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
//create singleton
  static final BackgroundService _instance = BackgroundService._internal();
  factory BackgroundService() => _instance;
  BackgroundService._internal();

  static const String _isolateName = 'background_service';
  static SendPort? _uiSendPort;

  initIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future callback() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    var result = await ApiService().getArticle();
    await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
