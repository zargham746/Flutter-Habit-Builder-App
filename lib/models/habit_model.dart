import 'package:flutter_habit_builder_app/models/date_model.dart';
import 'package:flutter_habit_builder_app/models/habit_completion_model.dart';

class HabitModel {
  final String habitName;
  final List<HabitCompletionModel> habitProgress;
  final DateModel habitDate;

  HabitModel({
    required this.habitDate,
    required this.habitName,
    required this.habitProgress,
  });
}
