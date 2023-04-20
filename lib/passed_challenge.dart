import 'package:flutter/material.dart';
import 'package:pose_detection/root_scaffold.dart';

class PassedChallenge extends StatelessWidget {
  const PassedChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You Have Completed the Challenge."),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RootScaffold()));
                },
                child: Text("Return to Home"))
          ],
        ),
      ),
    );
  }
}
