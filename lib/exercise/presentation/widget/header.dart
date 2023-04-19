import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Today's Activity",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.5,
              letterSpacing: -0.2,
              color: Color.fromRGBO(0, 0, 0, 0.52),
            ),
          ),
          // const Spacer(),
          InkWell(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    letterSpacing: -0.2,
                    color: Color.fromRGBO(0, 0, 0, 0.52),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                const Icon(
                  Icons.edit,
                  color: Color.fromRGBO(0, 0, 0, 0.52),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
