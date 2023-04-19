import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pose_detection/exercise/model/Meal.dart';
import 'package:pose_detection/exercise/presentation/widget/add_item.dart';
import 'package:pose_detection/exercise/presentation/widget/calorie.dart';
import 'package:pose_detection/exercise/presentation/widget/meal_card.dart';
import 'package:pose_detection/exercise/presentation/widget/quote.dart';
import 'package:pose_detection/exercise/presentation/widget/water.dart';

import '../widget/header.dart';
import '../widget/num_counter.dart';

class DailyGoal extends StatefulWidget {
  const DailyGoal({super.key});

  @override
  State<DailyGoal> createState() => _DailyGoalState();
}

class _DailyGoalState extends State<DailyGoal> {
  var liter = 0;
  var temp_litter = 0;
  var calorie = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 85),
            const Header(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Calorie(
                  calorie: calorie,
                ),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              // set this when inner content overflows, making RoundedRectangleBorder not working as expected
                              clipBehavior: Clip.antiAlias,
                              // set shape to make top corners rounded
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        width * .07,
                                        height * .025,
                                        width * .07,
                                        height * .02),
                                    height: height * .5,
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: ListView(
                                      children: [
                                        MealCard(
                                            meal: Meal(
                                              calories: 2300,
                                              name: 'shiro',
                                              image:
                                                  'https://th.bing.com/th/id/R.c3a5453520789da50fef390b0c11e90d?rik=joNKM98VdlhAjA&pid=ImgRaw&r=0',
                                            ),
                                            onChanged: (int value) {
                                              setState(() {
                                                calorie = calorie + value;
                                              });
                                            }),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const AddItem(
                              text: 'Meal', image: 'assets/icons/Simple.png')),
                      const SizedBox(height: 10),
                      InkWell(
                        child: const AddItem(
                          text: 'Water',
                          image: 'assets/icons/Glass.png',
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (
                                BuildContext context,
                              ) {
                                return AlertDialog(
                                  title: const Text(
                                      "How much water did you drink?"),
                                  content: NumericStepButton(
                                    minValue: 0,
                                    maxValue: 2000,
                                    onChanged: (int value) {
                                      temp_litter = value;
                                    },
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color(0xffC65368),
                                            shadowColor: Colors.black),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            liter = liter + (temp_litter);
                                          });

                                          // setState(() {
                                          //   searching = true;
                                          // });
                                        },
                                        child: const Text("Add"))
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            WaterTarget(
              litter: liter,
            ),
            const SizedBox(height: 60),
            const RandomQoute()
          ],
        ),
      ),
    );
  }
}
