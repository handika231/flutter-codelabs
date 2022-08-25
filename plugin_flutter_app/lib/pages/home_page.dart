import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_flutter_app/camera_page.dart';
import 'package:plugin_flutter_app/video_player_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;
  initCamera() async {
    cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoPlayerScreen(),
                  ),
                );
              },
              child: const Text(
                "Video Player",
              ),
            ),
            ElevatedButton(
              child: const Text('Camera Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CameraPage(cameraDescription: firstCamera),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
