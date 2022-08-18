import 'package:flutter/material.dart';
import 'package:state_app/done_module_list.dart';
import 'package:state_app/module_list.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final List<String> moduleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneModuleList(moduleList: moduleList),
                ),
              );
            },
            icon: const Icon(Icons.done),
          )
        ],
        title: const Text('Memulai Pemograman Dengan Dart'),
      ),
      body: ModuleList(doneModuleList: moduleList),
    );
  }
}
