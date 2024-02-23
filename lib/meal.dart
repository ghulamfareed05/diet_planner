import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final double calories;
  final double carbohydrates;
  final double proteins;
  final double fats;

  Recipe({
    required this.name,
    required this.calories,
    required this.carbohydrates,
    required this.proteins,
    required this.fats,
  });
}

class Meal extends StatefulWidget {
  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  List<Recipe> availableRecipes = [
    Recipe(name: 'Recipe 1', calories: 300, carbohydrates: 30, proteins: 20, fats: 10),
    Recipe(name: 'Recipe 2', calories: 400, carbohydrates: 40, proteins: 25, fats: 15),
    Recipe(name: 'Recipe 3', calories: 250, carbohydrates: 25, proteins: 15, fats: 8),
    // Add more recipes as needed
  ];

  List<Recipe> selectedRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: availableRecipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = availableRecipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  subtitle: Text('Calories: ${recipe.calories}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedRecipes.add(recipe);
                      });
                    },
                    child: Text('Add'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text(
            'Selected Recipes:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedRecipes.length,
              itemBuilder: (context, index) {
                Recipe recipe = selectedRecipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  subtitle: Text('Calories: ${recipe.calories}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedRecipes.removeAt(index);
                      });
                    },
                    child: Text('Remove'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text(
            'Total Nutritional Content:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Calories: ${calculateTotal('calories')}',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Carbohydrates: ${calculateTotal('carbohydrates')}g',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Proteins: ${calculateTotal('proteins')}g',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Fats: ${calculateTotal('fats')}g',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  double calculateTotal(String nutrient) {
    return selectedRecipes.fold(0.0, (sum, recipe) {
      switch (nutrient) {
        case 'calories':
          return sum + recipe.calories;
        case 'carbohydrates':
          return sum + recipe.carbohydrates;
        case 'proteins':
          return sum + recipe.proteins;
        case 'fats':
          return sum + recipe.fats;
        default:
          return sum;
      }
    });
  }
}