import 'package:flutter/material.dart';

class RetrieveTextView extends StatefulWidget {
  const RetrieveTextView({Key? key}) : super(key: key);

  @override
  State<RetrieveTextView> createState() => _RetrieveTextViewState();
}

class _RetrieveTextViewState extends State<RetrieveTextView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(_controller.text),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Retrieve Text Demo'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Type Something',
          ),
        ),
      ),
    );
  }
}
