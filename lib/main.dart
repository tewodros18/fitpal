import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pose_detection/exercise/presentation/screens/daily_goal.dart';
import 'package:pose_detection/pose_detector_view.dart';
import 'package:pose_detection/root_scaffold.dart';
import 'package:pose_detection/sign_in/sign_in_page.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyStatefulWidget(),
      //home: button(),
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PoseDetectorView(
                          exerciseType: 'JUMPING-JACKS',
                          enableMonitoring: false,
                        )));
          },
          child: Text("Push up")),
    );
  }
}
