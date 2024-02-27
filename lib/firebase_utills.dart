

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/meal_screen/components/recipe.dart';

  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    try {
      // Fetch breakfast recipes from the server
      QuerySnapshot<Map<String, dynamic>> recipeSnapshot =
      await FirebaseFirestore.instance.collection('Recipes-1').get();
      print("leghth: ${recipeSnapshot.docs.length}" );
      for (var recipeDoc in recipeSnapshot.docs) {
        Recipe recipeData = Recipe.fromMap(recipeDoc.data());
        recipes.add(recipeData);
      }
      print("breakfastRecipes: ${recipes.length}");
    } catch (e) {
      print(e.toString());
    }
    // print("breakfastRecipes hhh.....: ${breakfastRecipes}");
    return recipes;
  }
  List<Recipe> getRecipesByCategory(String category, List<Recipe> recipes) {
    return recipes.where((recipe) => recipe.category.contains(category)).toList();
  }