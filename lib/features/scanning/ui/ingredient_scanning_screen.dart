import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture_screen.dart';

class IngredientScanningScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const IngredientScanningScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<IngredientScanningScreen> createState() => _IngredientScanningScreenState();
}

class _IngredientScanningScreenState extends State<IngredientScanningScreen> {
  late CameraController _cameraController;
  late Future _initializeControllerFuture;

  Future initCamera(CameraDescription cameraDescription) async {
    // create a CameraController
    _cameraController = CameraController(cameraDescription, ResolutionPreset.high);

    // Initialize the controller
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      debugPrint("Take photo");
      final image = await _cameraController.takePicture();
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
          ),
        ),
      );
    } on CameraException catch (e) {
      debugPrint("Error occurred while taking picture: $e");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takePicture,
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
