import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImagePage extends StatelessWidget {
  const CacheImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/250?image=32',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
