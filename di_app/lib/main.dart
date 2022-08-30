import 'package:di_app/app_widget.dart';
import 'package:flutter/material.dart';

import 'locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const AppWidget());
}
