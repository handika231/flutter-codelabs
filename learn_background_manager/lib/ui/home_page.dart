import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:learn_background_manager/utils/background_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BackgroundService _backgroundService = BackgroundService();
  @override
  void initState() {
    super.initState();
    port.listen((message) async => await _backgroundService.someTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Start service'),
              onPressed: () async {
                await AndroidAlarmManager.oneShot(
                  const Duration(seconds: 2),
                  1,
                  BackgroundService.callback,
                  exact: true,
                  wakeup: true,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Start service'),
              onPressed: () async {
                await AndroidAlarmManager.periodic(
                  const Duration(minutes: 1),
                  2,
                  BackgroundService.callback,
                  startAt: DateTime.now(),
                  exact: true,
                  wakeup: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
