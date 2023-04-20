import 'package:flutter/material.dart';
import 'package:pose_detection/pose_detector_view.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "💪🏾 Workouts",
                  style: TextStyle(
                      color: Color.fromRGBO(25, 32, 44, 0.902),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoseDetectorView(
                                    exerciseType: 'JUMPING-JACKS',
                                    enableMonitoring: false,
                                  )));
                    },
                    child: exercise_tile(
                      name: "Jumping Jack",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoseDetectorView(
                                    exerciseType: 'JUMPING-JACKS',
                                    enableMonitoring: false,
                                  )));
                    },
                    child: exercise_tile(
                      name: "Biceps Curls",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoseDetectorView(
                                    exerciseType: 'JUMPING-JACKS',
                                    enableMonitoring: false,
                                  )));
                    },
                    child: exercise_tile(
                      name: "Squat",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class exercise_tile extends StatelessWidget {
  final name;
  const exercise_tile({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border:
              Border.all(color: Color.fromRGBO(25, 32, 44, 0.902), width: 1.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.fitness_center_outlined,
                  size: 45,
                  color: Color.fromRGBO(25, 32, 44, 0.902),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: RichText(
                  text: TextSpan(
                    text: name,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 25,
                  color: Color.fromRGBO(25, 32, 44, 0.902),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
