import 'package:diet_planner/components/default_button.dart';
import 'package:diet_planner/firebase_utills.dart';
import 'package:diet_planner/meal_plan/your_meal_plan.dart';
import 'package:diet_planner/meal_screen/components/recipe.dart';
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.name),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero widget for image transition (optional)
                Hero(
                  tag: recipe.id, // Unique identifier for the recipe
                  child: Image.network(
                    recipe.imageUrl,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Calories: ${recipe.calories}',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(16)),
                    ),
                    Text(
                      'Fat: ${recipe.fat}g',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(16)),
                    ),
                  ],
                ),

                SizedBox(height: getProportionateScreenHeight(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carbs: ${recipe.carbs}',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(16)),
                    ),
                    Text(
                      'Fiber: ${recipe.fiber}g',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(16)),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text(
                  'Protein: ${recipe.protein}g',
                  style: TextStyle(fontSize: getProportionateScreenHeight(16)),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text(
                  'Ingredients:',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                // List of ingredients with leading bullet points
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(16)),
                        ),
                        Expanded(
                          child: Text(
                            recipe.ingredients[index],
                            style: TextStyle(
                                fontSize: getProportionateScreenHeight(16)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                Text(
                  'Instructions:',
                  style: TextStyle(
                      fontSize: getProportionateScreenHeight(18),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                // List of instructions with numbered steps

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '. ',
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        recipe.instructions,
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(70),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: SizeConfig.screenWidth * 0.9,
          child: DefaultButton(
            text: 'Add to Meal Plan',
            press: () async {
              await updateUserData('${recipe.category}Id', recipe.id);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YourMealPlan()));
              // Add the recipe to the meal plan
            },
          ),
        ));
  }
}
