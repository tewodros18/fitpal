import 'package:flutter/material.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({Key? key}) : super(key: key);

  @override
  State<RootScaffold> createState() => _RootScaffoldState();
}

class _RootScaffoldState extends State<RootScaffold> {
  final List<Widget> _screens = [
    Scaffold(),
    Scaffold(),
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
        currentIndex: _selectedIndex,
        onTap: (index)=> setState(() {
          _selectedIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Workouts",
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
