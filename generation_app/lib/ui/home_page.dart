import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List babyBoomers = [for (var i = 1946; i <= 1964; i++) i];

  final List x = [for (var i = 1965; i <= 1980; i++) i];

  final List millenial = [for (var i = 1981; i <= 1995; i++) i];

  final List genZ = [for (var i = 1996; i <= 2020; i++) i];
  String message = '';

  final TextEditingController _controller = TextEditingController();

  ///fungsi untuk menampilkan snackbar
  void callSnackbar(String message, MaterialColor color) async {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: 'Your generation is $message',
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Generation App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                maxLength: 4,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter your year of birth',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                child: const Text('Generate'),
                onPressed: () {
                  try {
                    if (_controller.text.isNotEmpty) {
                      int year = int.parse(_controller.text);
                      if (babyBoomers.contains(year)) {
                        message = 'Baby Boomer';
                      } else if (x.contains(year)) {
                        message = 'X';
                      } else if (millenial.contains(year)) {
                        message = 'Millenial';
                      } else if (genZ.contains(year)) {
                        message = 'Gen Z';
                      } else {
                        message = 'Ya Ndak Tau Kok Tanya Saya';
                      }
                      callSnackbar(
                        message,
                        message.contains('Ndak')
                            ? Colors.amber
                            : Colors.lightGreen,
                      );
                    }
                    _controller.clear();
                  } catch (e) {
                    callSnackbar(
                      'Masukkan angka saja',
                      Colors.red,
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                child: const Text('Button label'),
                onPressed: () {
                  showConfirmationDialog(context: context, title: 'Title');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
