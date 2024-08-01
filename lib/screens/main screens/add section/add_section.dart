import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

class AddSection extends StatefulWidget {
  const AddSection({super.key});
  static const sectionAddress = '/addSection';

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  late CameraController controller;
  late Future<void> initializeController;
  int cameraPosition = 1;
  bool permissionStatus = false;

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: permissionStatus
                ? FutureBuilder<void>(
                    future: initializeController,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          width: width,
                          height: height,
                          child: CameraPreview(controller),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                : const Text('Camera permission not granted.'),
          ),
          Positioned(
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
                IconButton(
                  onPressed: () {
                    // controller.takePicture();
                  },
                  icon: const Icon(
                    Icons.circle_outlined,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        cameraPosition = cameraPosition == 0 ? 1 : 0;
                        _initCameraController();
                      },
                    );
                  },
                  icon: const Icon(Icons.flip),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getPermissions() async {
    var cameraPermissionStatus = await Permission.camera.status;
    if (!cameraPermissionStatus.isGranted) {
      cameraPermissionStatus = await Permission.camera.request();
    }
    setState(() {
      permissionStatus = cameraPermissionStatus.isGranted;
    });
    if (permissionStatus) {
      _initCameraController();
    }
  }

  void _initCameraController() {
    controller = CameraController(
      GetIt.I<List<CameraDescription>>()[cameraPosition],
      ResolutionPreset.max,
    );
    initializeController = controller.initialize();
    setState(() {});
  }
}
