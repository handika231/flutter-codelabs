import 'package:flutter/material.dart';

import 'swipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gesture App ~ Flutter Cookbook',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    builder: (context) => SwipePage(),
                  ),
                );
              },
              icon: const Icon(Icons.navigate_next))
        ],
        title: const Text('Gesture App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Tapped')));
              },
              child: const SizedBox(
                height: 60,
                width: 100,
                child: Center(
                  child: Text(
                    'Flat Button',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tapped'),
                  ),
                );
              },
              child: const SizedBox(
                height: 60,
                width: 100,
                child: Center(
                  child: Text(
                    'Gesture Detector',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//NOTE : You not only want to display information to users, you want users to interact with your app. Use the GestureDetector widget to respond to fundamental actions, such as tapping and dragging.