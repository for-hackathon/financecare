import 'package:flutter/material.dart';

class GoalState extends ChangeNotifier {
  String category = 'Телефон';
  double targetAmount = 100000;
  double savedAmount = 50000;
  int durationValue = 6;
  String durationType = 'месяцев';

  void updateGoal({
    required String newCategory,
    required double newTargetAmount,
    required int newDurationValue,
    required String newDurationType,
  }) {
    category = newCategory;
    targetAmount = newTargetAmount;
    durationValue = newDurationValue;
    durationType = newDurationType;
    notifyListeners();
  }

  double get progress {
    if (targetAmount <= 0) return 0;
    final value = savedAmount / targetAmount;
    return value.clamp(0.0, 1.0);
  }

  String get progressText {
    return 'Накоплено ${savedAmount.toStringAsFixed(0)} сом из ${targetAmount.toStringAsFixed(0)} сом';
  }

  String get deadlineText {
    return '$durationValue $durationType';
  }
}