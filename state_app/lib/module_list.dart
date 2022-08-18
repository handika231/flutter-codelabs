import 'package:flutter/material.dart';

class ModuleList extends StatefulWidget {
  final List<String> doneModuleList;
  const ModuleList({Key? key, required this.doneModuleList}) : super(key: key);

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  final List<String> _moduleList = const [
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (BuildContext context, int index) {
        return ModuleTile(
          isDone: widget.doneModuleList.contains(_moduleList[index]),
          onPressed: () {
            setState(() {
              widget.doneModuleList.add(_moduleList[index]);
            });
          },
          text: _moduleList[index],
        );
      },
    );
  }
}

class ModuleTile extends StatelessWidget {
  final String text;
  final bool isDone;
  final Function() onPressed;

  const ModuleTile(
      {Key? key,
      required this.text,
      required this.isDone,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
              onPressed: onPressed,
              child: const Text('Done'),
            ),
    );
  }
}
