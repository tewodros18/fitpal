import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final String text;
  final String image;
  const AddItem({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 255, 129, 152),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/icons/Vector.png",
          ),
          Text(text,
              style: const  TextStyle(
                  color: Color(0xffC65368),
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 25,
            child: Image.asset(
            image,
            ),
          ),
        ],
      ),
    );
  }
}
