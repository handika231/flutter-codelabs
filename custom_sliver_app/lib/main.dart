import 'package:custom_sliver_app/data/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver Demo'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const SliverListPage(),
    );
  }
}

class SliverAppHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;
  SliverAppHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppHeader(
        maxHeight: 150,
        minHeight: 60,
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _header('Android Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            androidPaths.map((e) {
              return ListTile(
                title: Text(e.title),
                subtitle: Text(e.description),
              );
            }).toList(),
          ),
        ),
        _header('iOS Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: iosPaths.map((e) {
            return ListTile(
              title: Text(e.title),
              subtitle: Text(e.description),
            );
          }).toList(),
        ),
        _header('Multiplatform Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            flutterPaths.map((e) {
              return ListTile(
                title: Text(e.title),
                subtitle: Text(e.description),
              );
            }).toList(),
          ),
        ),
        _header('Web Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: webPaths.map((e) {
            return ListTile(
              title: Text(e.title),
              subtitle: Text(e.description),
            );
          }).toList(),
        )
      ],
    );
  }
}
