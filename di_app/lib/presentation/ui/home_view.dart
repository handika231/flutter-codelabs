import 'package:di_app/presentation/provider/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CatProvider>(
          builder: (context, notifier, child) {
            final catImage = notifier.catImage;
            return Center(
              child: catImage != null
                  ? Image.network(catImage.url)
                  : const Text('Image not loaded yet'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () async {
          Provider.of<CatProvider>(context, listen: false).getImage();
        },
      ),
    );
  }
}
