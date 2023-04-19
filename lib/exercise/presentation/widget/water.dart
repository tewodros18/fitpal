import 'package:flutter/material.dart';

class WaterTarget extends StatelessWidget {
  final int litter;
  const WaterTarget({super.key, required this.litter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: const Color(0xffC65368)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset('assets/icons/Water.png'),
        Row(
          children: [
            Text(
              "$litter of 2000",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "ml",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
