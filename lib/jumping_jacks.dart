import 'package:flutter/material.dart';
import 'package:pose_detection/passed_challenge.dart';
import 'exercise.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'camera_view.dart';
import 'painters/pose_painter.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class JumpingJacks implements Exercise {
  @override
  String name;

  @override
  String type;
  bool enableMonitoring;
  int? target;

  JumpingJacks({
    required this.name,
    required this.type,
    this.enableMonitoring = false,
    this.target,
  });

  TextToSpeech tts = TextToSpeech();
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());

  Map<String, dynamic> thresholds = {
    "INACTIVE": 10,
  };

  Map<String, dynamic> angleThresholdsPerState = {
    "NORMAL": {
      "SHOULDER": [45, 0],
      "HIP": [0, 30]
    },
    "TRANSITION": {
      "SHOULDER": [100, 45],
      "HIP": [30, 40]
    },
    "PASS": {
      "SHOULDER": [180, 100],
      "HIP": [40, 45]
    },
  };

  int counter = 0;
  List<String> stateSeq = [];

  void _updateStateSeq(String state) {
    if (state == "TRANSITION") {
      if ((!stateSeq.contains("PASS") && !stateSeq.contains(state)) ||
          (stateSeq.contains("TRANSITION") && stateSeq.contains(state))) {
        stateSeq.add(state);
      }
    } else if (state == "PASS") {
      if (!stateSeq.contains(state) && stateSeq.contains("TRANSITION")) {
        stateSeq.add(state);
      }
    }
  }

  double getAngle(
    PoseLandmark firstPoint,
    PoseLandmark midPoint,
    PoseLandmark lastPoint,
  ) {
    double result = degrees(
        atan2(lastPoint.y - midPoint.y, lastPoint.x - midPoint.x) -
            atan2(firstPoint.y - midPoint.y, firstPoint.x - midPoint.x));
    result = result.abs(); // Angle should never be negative
    if (result > 180) {
      result =
          (360.0 - result); // Always get the acute representation of the angle
    }
    return result;
  }

  String getState(double leftShoulderAngle, rightShoulderAngle, hipAngle) {
    print("left ${leftShoulderAngle}");
    print("right ${rightShoulderAngle}");
    if (angleThresholdsPerState['NORMAL']['SHOULDER'][0] >= leftShoulderAngle &&
            leftShoulderAngle >=
                angleThresholdsPerState['NORMAL']['SHOULDER'][1] &&
            angleThresholdsPerState['NORMAL']['SHOULDER'][0] >=
                rightShoulderAngle &&
            rightShoulderAngle >=
                angleThresholdsPerState['NORMAL']['SHOULDER'][1]
        // angleThresholdsPerState['NORMAL']['HIP'][0] >= hipAngle &&
        // hipAngle >= angleThresholdsPerState['NORMAL']['HIP'][1]
        ) {
      return "NORMAL";
    }
    if (angleThresholdsPerState['TRANSITION']['SHOULDER'][0] >=
                leftShoulderAngle &&
            leftShoulderAngle >=
                angleThresholdsPerState['TRANSITION']['SHOULDER'][1] &&
            angleThresholdsPerState['TRANSITION']['SHOULDER'][0] >=
                rightShoulderAngle &&
            rightShoulderAngle >=
                angleThresholdsPerState['TRANSITION']['SHOULDER'][1]
        // angleThresholdsPerState['TRANSITION']['HIP'][0] >= hipAngle &&
        // hipAngle >= angleThresholdsPerState['TRANSITION']['HIP'][1]
        ) {
      return "TRANSITION";
    }
    if (angleThresholdsPerState['PASS']['SHOULDER'][0] >= leftShoulderAngle &&
            leftShoulderAngle >=
                angleThresholdsPerState['PASS']['SHOULDER'][1] &&
            angleThresholdsPerState['PASS']['SHOULDER'][0] >=
                rightShoulderAngle &&
            rightShoulderAngle >= angleThresholdsPerState['PASS']['SHOULDER'][1]
        // angleThresholdsPerState['PASS']['HIP'][0] >= hipAngle &&
        // hipAngle >= angleThresholdsPerState['PASS']['HIP'][1]
        ) {
      return "PASS";
    }

    return "";
  }

  @override
  int processExercise(List<Pose> poseAngles) {
    //compute angles

    double rightShoulderAngle = getAngle(
      poseAngles[0].landmarks[PoseLandmarkType.rightElbow]!,
      poseAngles[0].landmarks[PoseLandmarkType.rightShoulder]!,
      poseAngles[0].landmarks[PoseLandmarkType.rightHip]!,
    );
    double leftShoulderAngle = getAngle(
      poseAngles[0].landmarks[PoseLandmarkType.leftElbow]!,
      poseAngles[0].landmarks[PoseLandmarkType.leftShoulder]!,
      poseAngles[0].landmarks[PoseLandmarkType.leftHip]!,
    );
    double hipAngle = 10;
    String currentState =
        getState(leftShoulderAngle, rightShoulderAngle, hipAngle);
    _updateStateSeq(currentState);

    // tts.speak(currentState);
    if (currentState == "NORMAL") {
      if (stateSeq.length == 3) {
        counter++;
        tts.speak(counter.toString());

        if (target != null && counter == target) {
          tts.speak("Congratulations, You have completed the challenge");
          return 1;
        }
      } else if (stateSeq.contains("TRANSITION")) {
        //IMPROPER
      }
      stateSeq.clear();
    }
    return 0;
  }
}
