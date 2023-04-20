import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

abstract class Exercise {
  String name;
  String type;

  Exercise({
    required this.name,
    required this.type,
  });

  int processExercise(List<Pose> poses);
  int getCount();
}
