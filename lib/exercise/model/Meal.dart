// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Meal {
  final String name;
  final String image;
  final int calories;

  Meal({
    required this.name,
    required this.image,
    required this.calories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'calories': calories,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] as String,
      image: map['image'] as String,
      calories: map['calories'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}
