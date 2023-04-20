import 'package:flutter/material.dart';
import 'package:pose_detection/homepage/homepage.dart';

class PassedChallenge extends StatelessWidget {
  const PassedChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Text("You Have Completed the Challenge."),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: Text("Return to Home"))
          ],
        ),
      ),
    );
  }
}
