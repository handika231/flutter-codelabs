import 'package:flutter/material.dart';
import 'package:state_app/page/done_page.dart';
import 'package:state_app/page/list_page.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DonePage()));
            },
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
        title: const Text('Memulai Pemgrograman Dengan Dart'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: const ListPage(),
    );
  }
}
