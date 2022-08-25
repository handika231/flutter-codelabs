import 'package:flutter/material.dart';
import 'package:plugin_flutter_app/pages/home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Plugin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
