

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/goal_provider.dart';
import 'goal.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();
    final remainingPercentage = 100 - goalProvider.macroRatios.values.reduce((a, b) => a + b);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Dietary Goals'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Calorie target section
            Row(
              children: [
                const Text('Daily Calorie Target:'),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter calorie target',
                    ),
                    onChanged: (value) =>
                        goalProvider.updateCalorieTarget(int.parse(value)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),

            // Macronutrient section
            const Text('Macronutrient Ratios (%):'),
            Text('Carbs: ${goalProvider.macroRatios[Macronutrient.carbs]}'),
            // Slider for carbs
            Slider(
              value: goalProvider.macroRatios[Macronutrient.carbs]!,
              min: 0,
              max: 100 - remainingPercentage,
              onChanged: (value) =>
                  goalProvider.updateMacroRatio(Macronutrient.carbs, value),
            ),
            Text('Protein: ${goalProvider.macroRatios[Macronutrient.protein]}'),
            // Slider for protein
            Slider(
              value: goalProvider.macroRatios[Macronutrient.protein]!,
              min: 0,
              max: 100 - remainingPercentage,
              onChanged: (value) =>
                  goalProvider.updateMacroRatio(Macronutrient.protein, value),
            ),
            Text('Fat: ${goalProvider.macroRatios[Macronutrient.fat]}'),
            // Slider for fat
            Slider(
              value: goalProvider.macroRatios[Macronutrient.fat]!,
              min: 0,
              max: 100 - remainingPercentage,
              onChanged: (value) =>
                  goalProvider.updateMacroRatio(Macronutrient.fat, value),
            ),
            const SizedBox(height: 10.0),

            // Dietary restrictions section
            const Text('Dietary Restrictions:'),
            // Add checkboxes or a list for selecting restrictions
            // ...

            // Submit button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: goalProvider.isSubmitting
                    ? null
                    : () => goalProvider.submitGoal(),
                child: Text(goalProvider.isSubmitting ? 'Saving...' : 'Save Goals'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
