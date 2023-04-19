import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pose_detection/exercise/data_provider/meal_data_provider.dart';

import '../model/Meal.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final MealDataProvider mealDataProvider;

  MealBloc({required this.mealDataProvider}) : super(MealInitial()) {
    on<MealEvent>((event, emit) {
      if (event is GetMealEvent) {
        emit(MealLoadingState());

        mealDataProvider.getMeals().then((meals) {
          emit(MealLoadedState(meals));
        }).catchError((e) {
          emit(MealFailedState(e.toString()));
        });
      }
    });
  }
}
