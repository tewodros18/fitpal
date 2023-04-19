import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'camera_view.dart';
import 'painters/pose_painter.dart';
import 'package:text_to_speech/text_to_speech.dart';

import 'dart:math';
import 'package:vector_math/vector_math.dart';

double getAngle(
    PoseLandmark firstPoint, PoseLandmark midPoint, PoseLandmark lastPoint) {
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

class PoseDetectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Pose Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  int count = 0;
  bool counted = false;
  bool neutral = true;
  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = count.toString();
    });
    final poses = await _poseDetector.processImage(inputImage);
    if (poses.isNotEmpty) {
      print(poses[0].landmarks[PoseLandmarkType.nose]);
      double elbowAngle = getAngle(
          poses[0].landmarks[PoseLandmarkType.rightWrist]!,
          poses[0].landmarks[PoseLandmarkType.rightElbow]!,
          poses[0].landmarks[PoseLandmarkType.rightShoulder]!);
      print(elbowAngle);
      if (elbowAngle <= 25 && !counted == true) {
        count += 1;
        TextToSpeech tts = TextToSpeech();
        String text = count.toString();
        tts.speak(text);
        counted = true;
      }
      if (elbowAngle >= 160 && counted) {
        counted = false;
      }
    }

    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Poses found: ${poses.length}\n\n';
      // TODO: set _customPaint to draw landmarks on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
