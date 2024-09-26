enum Macronutrient { carbs, protein, fat }

class Goal {
  final int calorieTarget;
  final Map<Macronutrient, double> macroRatios;
  final List<String> dietaryRestrictions;

  Goal({
    required this.calorieTarget,
    required this.macroRatios,
    required this.dietaryRestrictions,
  });

  double get remainingMacroPercentage {
    final sum = macroRatios.values.reduce((a, b) => a + b);
    return 100 - sum;
  }
}