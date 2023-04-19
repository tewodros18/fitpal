import 'package:flutter/material.dart';

class Calorie extends StatelessWidget {
  final int calorie;
  const Calorie({super.key, required this.calorie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffC65368),
      ),
      child: Expanded(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset("assets/icons/Barbell.png"),
            ),
            const SizedBox(height: 15),
            Text(
              "$calorie/2300",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              "Calories",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
