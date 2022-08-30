import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_local/config/platform_widget.dart';
import 'package:news_app_local/provider/schedule_provider.dart';
import 'package:news_app_local/widgets/custom_dialog_widget.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = 'setting';
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routeName),
        centerTitle: true,
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIOS(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(routeName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIOS);
  }

  _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: const Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (val) => customDialog(context),
            ),
          ),
        ),
        Material(
          child: ListTile(
            title: const Text('Schedule News'),
            trailing: Consumer<SchedulingProvider>(
              builder: (context, schedule, child) => Switch.adaptive(
                value: schedule.isScheduled,
                onChanged: (value) async {
                  if (Platform.isIOS) {
                    customDialog(context);
                  } else {
                    schedule.scheduledNews(value);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
