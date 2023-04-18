import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Calorie extends StatelessWidget {
  const Calorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffC65368),
      ),
      child: Column(
        children: [
          // SvgPicture.asset("assets/icons/Barbell.svg", height: 50, width: 50),
          SizedBox(height: 40),
          Center(
            child: Image.asset("assets/icons/Barbell.png"),
          ),
          SizedBox(height: 15),
          const Text(
            "1350",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 3),
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
    );
  }
}
