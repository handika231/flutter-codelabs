import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: const Icon(Icons.flip),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Opacity Demo'),
      ),
      body: Center(
        child: AnimatedOpacity(
          curve: Curves.easeInToLinear,
          opacity: _visible ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
