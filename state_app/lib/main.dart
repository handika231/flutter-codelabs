//create my app

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_app/provider/module_provider.dart';

import 'module_page.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModuleProvider>(
      create: (context) => ModuleProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ModulePage(),
      ),
    );
  }
}
