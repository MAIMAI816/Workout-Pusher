import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// class PhotoUploadPage extends StatefulWidget {
//   @override
//   _PhotoUploadPageState createState() => _PhotoUploadPageState();
// }

// class _PhotoUploadPageState extends State<PhotoUploadPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             // Here we take the value from the MyHomePage object that was created by
//             // the App.build method, and use it to set our appbar title.
//             title: Text(''),
//             actions: <Widget>[
//               // action button
//               IconButton(
//                 icon: Icon(Icons.check, color: Colors.white),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PhotoUploadPage()));
//                 },
//               ),
//             ]),
//         body: Center(
//             child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 50,
//             ),
//             Text("Take today's your picture",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
//           ],
//         )));
//   }
// }

List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> loadCamera() async {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }

    loadCamera().then((data) {
      if (!controller.value.isInitialized) {
        return Container();
      }
      return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller));
    });
  }
}
