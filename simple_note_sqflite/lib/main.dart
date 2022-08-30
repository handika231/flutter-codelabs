import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_note_sqflite/provider/db_provider.dart';

import 'ui/note_list_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const NoteListPage(),
      ),
    );
  }
}
