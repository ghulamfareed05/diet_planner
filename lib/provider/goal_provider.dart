import 'package:flutter/foundation.dart';

import '../goal_screen/goal.dart';

class GoalProvider with ChangeNotifier {
  int _calorieTarget = 0;
  Map<Macronutrient, double> _macroRatios = {
    Macronutrient.carbs: 50,
    Macronutrient.protein: 25,
    Macronutrient.fat: 25,
  };
  List<String> _dietaryRestrictions = [];
  bool _isSubmitting = false;

  int get calorieTarget => _calorieTarget;
  set calorieTarget(int value) {
    _calorieTarget = value;
    notifyListeners();
  }

  Map<Macronutrient, double> get macroRatios => _macroRatios;
  set macroRatios(Map<Macronutrient, double> value) {
    _macroRatios = value;
    notifyListeners();
  }

  List<String> get dietaryRestrictions => _dietaryRestrictions;
  set dietaryRestrictions(List<String> value) {
    _dietaryRestrictions = value;
    notifyListeners();
  }

  bool get isSubmitting => _isSubmitting;
  set isSubmitting(bool value) {
    _isSubmitting = value;
    notifyListeners();
  }

  void updateCalorieTarget(int target) {
    calorieTarget = target;
  }

  void updateMacroRatio(Macronutrient macro, double value) {
    macroRatios[macro] = value;
    // Ensure other ratios adjust to maintain 100% total
    final remainingPercentage = 100 - macroRatios.values.reduce((a, b) => a + b);
    for (var key in macroRatios.keys) {
      if (key != macro) {
        macroRatios[key] = macroRatios[key]! * (remainingPercentage / 100);
      }
    }
  }

  void toggleDietaryRestriction(String restriction, bool isSelected) {
    if (isSelected) {
      dietaryRestrictions.add(restriction);
    } else {
      dietaryRestrictions.remove(restriction);
    }
  }

  void submitGoal() async {
    // Implement logic to save goals (e.g., shared preferences, database)
    isSubmitting = true;
    // Simulate delay for saving
    await Future.delayed(const Duration(seconds: 2));
    isSubmitting = false;
  }
  double get remainingMacroPercentage {
    final sum = macroRatios.values.reduce((a, b) => a + b);
    return 100 - sum;
  }
}
