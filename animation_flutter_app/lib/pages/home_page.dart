import 'package:flutter/material.dart';

import 'other_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Other Page'),
              onPressed: () {
                Navigator.push(context, _createRoute());
              },
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const OtherPage();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        print(child);
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        final tween = Tween(begin: begin, end: end);
        final curveAnimation = CurvedAnimation(parent: animation, curve: curve);
// TODO: Other way to do this
        // final curveTween = CurveTween(curve: curve);
        // final tween = Tween(begin: begin, end: end).chain(curveTween);
        // final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: tween.animate(curveAnimation),
          child: child,
          // position: offsetAnimation,
        );
      },
    );
  }
}
