import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription cameraDescription;

  const CameraPage({Key? key, required this.cameraDescription})
      : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initCameraControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameraDescription,
      ResolutionPreset.medium,
    );
    _initCameraControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initCameraControllerFuture;
            final image = await _controller.takePicture();
            if (!mounted) return;
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DisplayPictureScreen(imageFile: image.path),
                ));
          } catch (e) {
            rethrow;
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      appBar: AppBar(
        title: const Text('Take a Picture'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: _initCameraControllerFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imageFile;
  const DisplayPictureScreen({Key? key, required this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
      ),
      body: Image.file(File(imageFile)),
    );
  }
}
