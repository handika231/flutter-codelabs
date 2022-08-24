import 'package:design_flutter_app/pages/display_snackbar_app.dart';
import 'package:design_flutter_app/pages/drawer_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter  ~ Design'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: const Text('Drawer App'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DrawerApp(),
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Display Snackbar App'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DisplaySnackbarApp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
