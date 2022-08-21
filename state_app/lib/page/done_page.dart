import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/module_provider.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ModuleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: provider.moduleList.map((e) => Text(e)).toList(),
      ),
    );
  }
}
