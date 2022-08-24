import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        // CHANGE ICON DRAWER
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.circle),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
    );
  }
}
