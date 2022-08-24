import 'dart:math';

import 'package:flutter/material.dart';

class OrientationApp extends StatelessWidget {
  OrientationApp({Key? key}) : super(key: key);
  final List<Widget> _widgets =
      List.generate(30, (index) => Text('Item $index'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            itemCount: _widgets.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                alignment: Alignment.center,
                child: _widgets[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
