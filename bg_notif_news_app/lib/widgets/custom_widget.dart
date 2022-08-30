import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_local/routes/navigation.dart';

class CustomWidget extends StatelessWidget {
  final Widget body;
  const CustomWidget({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            body,
            Card(
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                ),
              ),
              margin: EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigation.back();
                    },
                    icon: defaultTargetPlatform == TargetPlatform.iOS
                        ? const Icon(Icons.arrow_back_ios)
                        : const Icon(Icons.arrow_back),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'N',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
