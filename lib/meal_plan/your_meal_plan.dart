
import 'package:flutter/material.dart';

class YourMealPlan extends StatefulWidget {
  const YourMealPlan({super.key});

  @override
  State<YourMealPlan> createState() => _YourMealPlanState();
}

class _YourMealPlanState extends State<YourMealPlan> {
  final List<Meal> _meals = [
    Meal(
      time: 'Breakfast',
      name: 'Oatmeal with berries',
      calories: 300,
    ),
    Meal(
      time: 'Lunch',
      name: 'Chicken salad sandwich',
      calories: 450,
    ),
    Meal(
      time: 'Dinner',
      name: 'Salmon with roasted vegetables',
      calories: 500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan'),
      ),
      body: ListView.builder(
        itemCount: _meals.length,
        itemBuilder: (context, index) {
          final meal = _meals[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.time,
                            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            meal.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${meal.calories} kcal',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Meal {
  final String time;
  final String name;
  final int calories;

  const Meal({
    required this.time,
    required this.name,
    required this.calories,
  });
}
