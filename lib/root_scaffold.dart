import 'package:flutter/material.dart';
import 'package:pose_detection/exercise/presentation/screens/daily_goal.dart';
import 'package:pose_detection/homepage/homepage.dart';
import 'package:pose_detection/pose_detector_view.dart';
import 'package:pose_detection/workout_page/workout_page.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({Key? key}) : super(key: key);

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  final List<Widget> _screens = [
    HomePage(),
    WorkOutPage(),
    Scaffold(),
    DailyGoal(),
    Scaffold(),
  ];
  // final List<IconData> _icons = [Icons.home, Icons.library_music, Icons.person];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        selectedItemColor: Color.fromRGBO(198, 83, 104, 1),
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromRGBO(36, 34, 34, 0.651),
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Workouts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_searching_rounded),
            label: "Challenges",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.golf_course_sharp),
            label: "Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
