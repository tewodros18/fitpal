import 'package:flutter/material.dart';

class RandomQoute extends StatelessWidget {
  const RandomQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Text(
        '“Failure is unimportant. It takes courage to make a fool of yourself. “',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.0,
          letterSpacing: -0.2,
          fontWeight: FontWeight.w900,
          color: Color.fromRGBO(0, 0, 0, 0.52),
        ),
      ),
    );
  }
}
