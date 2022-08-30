import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app_local/app/application.dart';
import 'package:news_app_local/utils/background_service.dart';
import 'package:news_app_local/utils/notification_helper.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService backgroundService = BackgroundService();
  backgroundService.initIsolate();
  await AndroidAlarmManager.initialize();

  await notificationHelper.initNotification(flutterLocalNotificationsPlugin);
  runApp(const Application());
}
