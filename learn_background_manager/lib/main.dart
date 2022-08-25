import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:learn_background_manager/ui/home_page.dart';
import 'package:learn_background_manager/utils/background_Service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final BackgroundService backgroundService = BackgroundService();
  await backgroundService.initIsolate();
  await AndroidAlarmManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
