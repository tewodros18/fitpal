import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Meal.dart';

class MealDataProvider {
  final http.Client httpClient = http.Client();

  MealDataProvider();

  Future<List<Meal>> getMeals() async {
    try {
      return [
        Meal(
            name: "shiro",
            image:
                "https://th.bing.com/th/id/R.c3a5453520789da50fef390b0c11e90d?rik=joNKM98VdlhAjA&pid=ImgRaw&r=0",
            calories: 300)
      ];

      final response = await httpClient.get(
        Uri.parse('http://localhost:3000/api/v1/food'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      print("here??");
      if (response.statusCode == 200) {
        final m = jsonDecode(response.body) as List;
        List<Meal> meals =
            m.map((mealJson) => Meal.fromJson(mealJson)).toList();

        // return meals;
      } else {
        throw Exception('Failed to Fetch Meals');
      }
    } catch (e) {
      return [
        Meal(
            name: "shiro",
            image:
                "https://th.bing.com/th/id/R.c3a5453520789da50fef390b0c11e90d?rik=joNKM98VdlhAjA&pid=ImgRaw&r=0",
            calories: 300)
      ];
    }
  }
}
