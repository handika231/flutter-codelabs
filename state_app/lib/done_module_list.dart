import 'package:flutter/material.dart';

class DoneModuleList extends StatelessWidget {
  final List moduleList;
  const DoneModuleList({Key? key, required this.moduleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: moduleList.map((module) {
          return ListTile(
            title: Text(module),
            trailing: const Icon(Icons.done),
          );
        }).toList(),
      ),
    );
  }
}
