import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_app/provider/module_provider.dart';

class ListPage extends StatelessWidget {
  final List<String> moduleList = const [
    'Modul 1 - Pengenalan Dart',
    'Modul 2 - Memulai Pemrograman dengan Dart',
    'Modul 3 - Dart Fundamental',
    'Modul 4 - Control Flow',
    'Modul 5 - Collections',
    'Modul 6 - Object Oriented Programming',
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Consumer<ModuleProvider>(
          builder: (context, value, child) => TileWidget(
            isDone: value.moduleList.contains(moduleList[index]),
            onPressed: () {
              value.addModule(moduleList[index]);
            },
            text: moduleList[index],
          ),
        );
      },
      itemCount: moduleList.length,
    );
  }
}

class TileWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  final Function() onPressed;
  const TileWidget(
      {Key? key,
      required this.isDone,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: isDone
          ? const Icon(Icons.check)
          : ElevatedButton(
              key: Key(text),
              onPressed: onPressed,
              child: const Text('Done'),
            ),
    );
  }
}
