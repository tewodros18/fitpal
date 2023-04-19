part of 'meal_bloc.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class MealLoadingState extends MealState {}

class MealFailedState extends MealState {
  final String msg;

  MealFailedState(this.msg);
}

class MealLoadedState extends MealState {
  final List<Meal> meals;

  MealLoadedState(this.meals);
}
