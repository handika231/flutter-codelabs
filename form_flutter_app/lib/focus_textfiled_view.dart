import 'package:flutter/material.dart';

class FocusTextFieldView extends StatefulWidget {
  const FocusTextFieldView({Key? key}) : super(key: key);

  @override
  State<FocusTextFieldView> createState() => _FocusTextFieldViewState();
}

class _FocusTextFieldViewState extends State<FocusTextFieldView> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(myFocusNode);
        },
        child: const Icon(Icons.note),
      ),
      appBar: AppBar(
        title: const Text('Focus TextField Demo'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            //create 2 textfield
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              focusNode: myFocusNode,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onSubmitted: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
