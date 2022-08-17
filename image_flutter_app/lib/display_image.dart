import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network('https://picsum.photos/250?image=9'),
          ],
        ),
      ),
    );
  }
}

// 1. The default Image.network constructor doesn’t handle more advanced functionality, such as fading images in after loading, or caching images to the device after they’re downloaded.
