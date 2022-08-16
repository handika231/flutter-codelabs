import 'package:flutter/material.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({Key? key}) : super(key: key);

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  final List<String> _listWidget = List.generate(
    100,
    (i) => 'Item ${i + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _listWidget.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _listWidget[index];
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              setState(() {
                _listWidget.removeAt(index);
              });
            },
            key: Key(item),
            child: ListTile(
              title: Text('Item $item'),
            ),
          );
        },
      ),
    );
  }
}


// Flutter makes this task easy by providing the Dismissible widget. Learn how to implement swipe to dismiss with the following steps:

// Create a list of items.
// Wrap each item in a Dismissible widget.
// Provide “leave behind” indicators.
