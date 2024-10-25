// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// class CameraApp extends StatefulWidget {
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   Future<void> initializeCamera() async {
//     try {
//       // Get a list of the available cameras
//       final cameras = await availableCameras();
//       // Use the first camera
//       _controller = CameraController(
//         cameras[0],
//         ResolutionPreset.high,
//       );
//       _initializeControllerFuture = _controller.initialize();
//     } catch (e) {
//       print('Error initializing camera: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> takePicture() async {
//     try {
//       await _initializeControllerFuture;

//       // Define the path to save the image
//       final directory = await getApplicationDocumentsDirectory();
//       final path = join(directory.path, '${DateTime.now()}.png');

//       // Take the picture and save it to the file
//       await _controller.takePicture(path);

//       // Show a message after taking the picture
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Picture saved to $path')),
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera App'),
//       ),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: takePicture,
//         tooltip: 'Take Picture',
//         child: Icon(Icons.camera),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: CameraApp()));
// }
