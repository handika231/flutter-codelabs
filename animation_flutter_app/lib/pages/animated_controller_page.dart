import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedControllerPage extends StatefulWidget {
  const AnimatedControllerPage({Key? key}) : super(key: key);

  @override
  State<AnimatedControllerPage> createState() => _AnimatedControllerPageState();
}

class _AnimatedControllerPageState extends State<AnimatedControllerPage> {
  double _height = 50;
  double _width = 50;
  Color _color = Colors.lightBlue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
