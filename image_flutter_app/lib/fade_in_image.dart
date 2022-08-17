import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// 2. When displaying images using the default Image widget, you might notice they simply pop onto the screen as they’re loaded. This might feel visually jarring to your users.
// Instead, wouldn’t it be nice to display a placeholder at first, and images would fade in as they’re loaded? Use the FadeInImage widget for exactly this purpose.
// TODO : Using package transparent_image
class FadeInImagePage extends StatelessWidget {
  const FadeInImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=12',
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
