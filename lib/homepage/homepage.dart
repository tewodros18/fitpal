import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String js = '''
  const modelViewer = document.querySelector('#change-speed-demo');
  const speeds = [1];

  let i = 0;
  const play = () => {
    modelViewer.timeScale = speeds[i++%speeds.length];
    modelViewer.play({repetitions: 1});
  };
  modelViewer.addEventListener('load', play);
  modelViewer.addEventListener('finished', play);
''';

class _HomePageState extends State<HomePage> {
  String src = "assets/warmup.glb";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 100, 0, 0),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: "👋 Drag and drop a workout on the Avatar!",
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                SizedBox(height: 400, child: avatar(key: UniqueKey(), sr: src)),
                DragTarget(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Container(),
                    );
                  },
                  onAccept: (data) async => {
                    await Future.delayed(const Duration(seconds: 3)),
                  },
                ),
              ],
            ),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Draggable(
                          data: "assets/squat.glb",
                          childWhenDragging: Container(),
                          feedback: workout(
                            name: "Squat",
                          ),
                          child: workout(
                            name: "Squat",
                          ),
                          onDragCompleted: () {
                            setState(() {
                              src = "assets/squat.glb";
                            });
                          },
                        ),
                        Draggable(
                          data: "assets/burpee.glb",
                          childWhenDragging: Container(),
                          feedback: workout(
                            name: "Burpee",
                          ),
                          child: workout(
                            name: "Burpee",
                          ),
                          onDragCompleted: () {
                            setState(() {
                              src = "assets/burpee.glb";
                            });
                          },
                        ),
                        Draggable(
                          data: "assets/pistol.glb",
                          childWhenDragging: Container(),
                          feedback: workout(
                            name: "Pistol",
                          ),
                          child: workout(
                            name: "Pistol",
                          ),
                          onDragCompleted: () {
                            setState(() {
                              src = "assets/pistol.glb";
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class workout extends StatelessWidget {
  final name;
  const workout({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        color: Color.fromRGBO(198, 83, 104, 1),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.fitness_center_rounded,
              color: Color.fromRGBO(255, 255, 255, 0.698),
              size: 45,
            ),
            RichText(
              text: TextSpan(
                text: name,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.698),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class avatar extends StatelessWidget {
  String sr = "assets/warmup.glb";
  avatar({super.key, required this.sr});

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      id: "change-speed-demo",
      cameraControls: true,
      animationName: "Armature|mixamo.com|Layer0",
      ar: true,
      shadowIntensity: 1,
      src: sr,
      alt: "An animate 3D model of a robot",
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      relatedJs: js,
    );
  }
}
