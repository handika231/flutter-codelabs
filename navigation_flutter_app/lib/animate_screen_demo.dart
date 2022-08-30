import 'package:flutter/material.dart';

class AnimateScreenDemo extends StatelessWidget {
  const AnimateScreenDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailAnimate()),
            );
          },
          child: Hero(
            tag: 'hero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailAnimate extends StatelessWidget {
  const DetailAnimate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'hero',
        child: Image.network(
          'https://picsum.photos/250?image=9',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
