import 'package:flutter/material.dart';

class WaterTarget extends StatelessWidget {
  const WaterTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffC65368)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset('assets/icons/Water.png'),
        const Row(
          children: [
            Text(
              "0.5 of 2",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Litters",
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
