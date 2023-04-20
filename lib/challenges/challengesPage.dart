import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pose_detection/challenges/data_provider.dart';
import 'package:pose_detection/pose_detector_view.dart';

import '../challenge.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  List<Challenge> challenges = ChallengeProvider.getChallenges();

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
                  text: "💪🏾 Challenges",
                  style: TextStyle(
                      color: Color.fromRGBO(25, 32, 44, 0.902),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Challenge challenge = challenges[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoseDetectorView(
                                    exerciseType: challenge.exerciseId,
                                    enableMonitoring: false,
                                    target: challenge.repetition!.toInt(),
                                  )));
                    },
                    child: exercise_tile(
                      name: challenge.name,
                      target: challenge.repetition!.toInt(),
                    ),
                  );
                },
                itemCount: challenges.length,
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => PoseDetectorView(
            //                         exerciseType: 'JUMPING-JACKS',
            //                         enableMonitoring: false,
            //                         target: 5,
            //                       )));
            //         },
            //         child: exercise_tile(
            //           name: "Jumping Jack",
            //           target: 5,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => PoseDetectorView(
            //                         exerciseType: 'JUMPING-JACKS',
            //                         enableMonitoring: false,
            //                         target: 5,
            //                       )));
            //         },
            //         child: exercise_tile(
            //           name: "Biceps Curls",
            //           target: 5,
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => PoseDetectorView(
            //                         exerciseType: 'JUMPING-JACKS',
            //                         enableMonitoring: true,
            //                         target: 5,
            //                       )));
            //         },
            //         child: exercise_tile(
            //           name: "Squat",
            //           target: 5,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () {
          TextEditingController nameController = TextEditingController();
          TextEditingController exerciseController = TextEditingController();
          TextEditingController repetitionController = TextEditingController();
          String name = "";
          String exerciseId = "";
          double rep = 0;

          nameController.addListener(() {
            name = nameController.value.text;
          });
          exerciseController.addListener(() {
            exerciseId = exerciseController.value.text;
          });
          repetitionController.addListener(() {
            rep = int.parse(repetitionController.value.text).toDouble();
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add a new Challenge"),
                  content: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Note: Same code is applied for the TextFormField as well

                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Challenge Name",
                            errorBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent),
                            ),
                          ),
                        ),

                        TextField(
                          controller: exerciseController,
                          decoration: InputDecoration(
                            hintText: "Exercise Name",
                            errorBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent),
                            ),
                          ),
                        ),

                        TextField(
                          controller: repetitionController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: "Number of reps",
                            errorBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 3, color: Colors.greenAccent),
                            ),
                          ),
                        ),

                        OutlinedButton(
                            onPressed: () {
                              debugPrint("dsjkfskdjfkjsdfkjwdfkdjsfnkjdfhkdwj");
                              debugPrint(name.toString());
                              debugPrint(exerciseId);
                              debugPrint(rep.toString());
                              challenges.add(Challenge(
                                name: name,
                                exerciseId: exerciseId,
                                repetition: rep,
                              ));
                              setState(() {});
                            },
                            child: Text("Submit"))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class exercise_tile extends StatelessWidget {
  final String name;
  final int target;

  const exercise_tile({super.key, required this.name, required this.target});

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
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    text: name,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: RichText(
                text: TextSpan(
                  text: "${target.toString()} - Reps",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )),
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
