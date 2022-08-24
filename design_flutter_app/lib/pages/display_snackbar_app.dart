import 'package:flutter/material.dart';

class DisplaySnackbarApp extends StatelessWidget {
  const DisplaySnackbarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Snackbar'),
          onPressed: () {
            // SHOW SNACKBAR
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Hello from the snackbar.'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}
