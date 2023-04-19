import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'camera_view.dart';
import 'painters/pose_painter.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart';

class JumpingJacks {
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());

  //Define all the landmarks relating to  the exercise

  //Describe three states for the jumping jacks exercise
  // Map<String, dynamic> states = {'NORMAL': '', 'TRANSITION': '', 'PASS': ''};

  Map<String, dynamic> thresholds = {
    "INACTIVE": 10,
  };

  Map<String, dynamic> angleThresholdsPerState = {
    "NORMAL": {
      "SHOULDER": [180, 135],
      "HIP": [0, 30]
    },
    "TRANSITION": {
      "SHOULDER": [135, 120],
      "HIP": [30, 40]
    },
    "PASS": {
      "SHOULDER": [120, 0],
      "HIP": [40, 45]
    },
  };

  int counter = 0;

  List<String> stateSeq = [];

  // String _checkPoseState(Map<String, List<double>> poses) {
  //   //Extract relevant landmarks from poses
  //
  //   //Compare their values with those of each state
  //
  //   //return in which state the pose is in
  //   return '';
  // }

  void _updateStateSeq(String state) {
    if(state == "TRANSITION"){
      if((!stateSeq.contains("PASS") && !stateSeq.contains(state)) || (stateSeq.contains("TRANSITION") && stateSeq.contains(state))){
        stateSeq.add(state);
      }
    } else if (state == "PASS"){
      if(!stateSeq.contains(state) && stateSeq.contains("TRANSITION")){
        stateSeq.add(state);
      }
    }
  }

  String getState(double leftShoulderAngle, rightShoulderAngle, hipAngle) {
    if (angleThresholdsPerState['NORMAL']['SHOULDER'][0] >= leftShoulderAngle &&
        leftShoulderAngle >= angleThresholdsPerState['NORMAL']['SHOULDER'][1] &&
        angleThresholdsPerState['NORMAL']['SHOULDER'][0] >=
            rightShoulderAngle &&
        rightShoulderAngle >=
            angleThresholdsPerState['NORMAL']['SHOULDER'][1] &&
        angleThresholdsPerState['NORMAL']['HIP'][0] >= hipAngle &&
        hipAngle >= angleThresholdsPerState['NORMAL']['HIP'][1]) {
      return "NORMAL";
    }
    if (angleThresholdsPerState['TRANSITION']['SHOULDER'][0] >=
            leftShoulderAngle &&
        leftShoulderAngle >=
            angleThresholdsPerState['TRANSITION']['SHOULDER'][1] &&
        angleThresholdsPerState['TRANSITION']['SHOULDER'][0] >=
            rightShoulderAngle &&
        rightShoulderAngle >=
            angleThresholdsPerState['TRANSITION']['SHOULDER'][1] &&
        angleThresholdsPerState['TRANSITION']['HIP'][0] >= hipAngle &&
        hipAngle >= angleThresholdsPerState['TRANSITION']['HIP'][1]) {
      return "TRANSITION";
    }
    if (angleThresholdsPerState['PASS']['SHOULDER'][0] >= leftShoulderAngle &&
        leftShoulderAngle >= angleThresholdsPerState['PASS']['SHOULDER'][1] &&
        angleThresholdsPerState['PASS']['SHOULDER'][0] >= rightShoulderAngle &&
        rightShoulderAngle >= angleThresholdsPerState['PASS']['SHOULDER'][1] &&
        angleThresholdsPerState['PASS']['HIP'][0] >= hipAngle &&
        hipAngle >= angleThresholdsPerState['PASS']['HIP'][1]) {
      return "PASS";
    }

    return "";
  }

  Future<void> processImage(InputImage inputImage) async {
    final poses = await _poseDetector.processImage(inputImage);
    //compute angles

    double leftShoulderAngle = 120;
    double rightShoulderAngle = 120;
    double hipAngle = 10;
    String currentState =
        getState(leftShoulderAngle, rightShoulderAngle, hipAngle);

    if (currentState == "NORMAL") {
      if (stateSeq.length == 3) {
        counter++;
      } else if (stateSeq.contains("TRANSITION")) {
        //IMPROPER
      }
      stateSeq.clear();
    }
  }
}
