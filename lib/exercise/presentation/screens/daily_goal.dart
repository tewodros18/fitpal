import 'package:flutter/material.dart';
import 'package:pose_detection/exercise/presentation/widget/add_item.dart';
import 'package:pose_detection/exercise/presentation/widget/calorie.dart';
import 'package:pose_detection/exercise/presentation/widget/quote.dart';
import 'package:pose_detection/exercise/presentation/widget/water.dart';

import '../widget/header.dart';

class DailyGoal extends StatelessWidget {
  const DailyGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        title: const Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Aman,',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.52),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.2),
              ),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
              child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/github.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            // child: Image.asset('assets/icons/github.jpg')),
          )),
          SizedBox(width: 40)
        ],
        elevation: 0,
        backgroundColor: const Color(0xffF6F6F6),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            Header(),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calorie(),
                Column(
                  children: [
                    AddItem(text: 'Meal', image: 'assets/icons/Simple.png'),
                    SizedBox(height: 10),
                    AddItem(
                      text: 'Water',
                      image: 'assets/icons/Glass.png',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),
            WaterTarget(),
            SizedBox(height: 60),
            RandomQoute()
          ],
        ),
      ),
    );
  }
}
