import 'package:flutter/material.dart';
import 'package:network_flutter_app/model/album.dart';

import '../utils/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<Album> _futureAlbum;
  @override
  void initState() {
    super.initState();
    _futureAlbum = ApiService.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: _futureAlbum,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Text(snapshot.data.title);
          }
        },
      ),
    ));
  }
}
