

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../meal_screen/components/recipe.dart';

// class RecipeProvider with ChangeNotifier {
//   final List<Recipe> _recipes = [];
//
//   List<Recipe> get recipes => _recipes.toList();
//
//   Future<void> fetchRecipes() async {
//     try {
//       // Fetch recipes
//       final recipeSnapshot =
//       await FirebaseFirestore.instance.collection('Recipes-1').get();
//
//       _recipes.clear(); // Clear existing data before adding new
//
//       for (var recipeDoc in recipeSnapshot.docs) {
//         final recipeMap = recipeDoc.data();
//         final recipe = Recipe.fromMap(recipeMap);
//         print("recipe........: ${recipe}");
//         _recipes.add(recipe);
//       }
//
//       notifyListeners(); // Notify listeners about changes
//     } catch (e) {
//       print(e); // Handle errors
//     }
//   }
//
//   List<Recipe> getRecipesByCategory(String category) {
//     return recipes.where((recipe) => recipe.categories.contains(category)).toList();
//   }
// }









class RecipeProvider with ChangeNotifier {

  // RecipeProvider() {
  //   fetchRecipes();
  // }

  final List<Map<String, dynamic>> _breakfastRecipes = [];
  final List<Map<String, dynamic>> _lunchRecipes = [];
  final List<Map<String, dynamic>> _dinnerRecipes = [];

  // Getters for accessing recipes
  List<Map<String, dynamic>> get breakfastRecipes => _breakfastRecipes;

  List<Map<String, dynamic>> get lunchRecipes => _lunchRecipes;

  List<Map<String, dynamic>> get dinnerRecipes => _dinnerRecipes;



  Future<List<Map<String, dynamic>>> getBreakfastRecipes(String category) async {
    List<Map<String, dynamic>> breakfastRecipes = [];
    try {
      // Fetch breakfast recipes from the server
      QuerySnapshot<Map<String, dynamic>> recipeSnapshot =
      await FirebaseFirestore.instance.collection('Recipes-1').get();
      print("leghth: ${recipeSnapshot.docs.length}" );
      for (var recipeDoc in recipeSnapshot.docs) {
    Map<String, dynamic> recipeData = recipeDoc.data();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> value"+recipeDoc.toString());
    breakfastRecipes.add(recipeData);
    }
      // print("breakfastRecipes: ${breakfastRecipes}");
      notifyListeners();
    } catch (e) {
      print(e);
    }
    // print("breakfastRecipes hhh.....: ${breakfastRecipes}");
  return breakfastRecipes;
  }
  // Future<void> fetchRecipes() async {
  //   try {
  //     // Fetch breakfast recipes
  //     QuerySnapshot<Map<String, dynamic>> breakfastSnapshot =
  //     await FirebaseFirestore.instance.collection('Recipes-1').where(
  //         'categories', isEqualTo: 'breakfast').get();
  //     print("breakfastSnapshot ${breakfastSnapshot.docs}");
  //     _breakfastRecipes.clear(); // Clear existing data before adding new
  //
  //     _breakfastRecipes.addAll(
  //         breakfastSnapshot.docs.map((doc) => doc.data()).toList());
  //     print(_breakfastRecipes);
  //     // Fetch lunch recipes (similar approach)
  //     // ...
  //
  //     // Fetch dinner recipes (similar approach)
  //     // ...
  //
  //     notifyListeners(); // Notify listeners about changes
  //   } catch (e) {
  //     print(e); // Handle errors
  //   }
  // }
}
// // Call fetchRecipes() in your app to initiate data fetching
// // ...
// }

  // Future<List<Map<String, dynamic>>> getBreakfastRecipes(String category) async {
  //   List<Map<String, dynamic>> breakfastRecipes = [];
  //   try {
  //     // Fetch breakfast recipes from the server
  //     QuerySnapshot<Map<String, dynamic>> recipeSnapshot =
  //     await FirebaseFirestore.instance.collection('Recipes-1').where('categories', isEqualTo: category).get();
  //     for (var recipeDoc in recipeSnapshot.docs) {
  //   Map<String, dynamic> recipeData = recipeDoc.data();
  //   breakfastRecipes.add(recipeData);
  //   }
  //   } catch (e) {
  //     print(e);
  //   }
  // return breakfastRecipes;
  // }


//   final List<Recipe> _recipes = [];
//
//   List<Recipe> get recipes => _recipes.toList(); // Return a copy of the list
//
//   Future<void> fetchRecipes() async {
//     try {
//       final recipeCollection = FirebaseFirestore.instance.collection('Recipes-1');
//       final querySnapshot = await recipeCollection.get();
//
//       _recipes.clear(); // Clear existing data to avoid duplicates
//
//       for (var recipeDoc in querySnapshot.docs) {
//         final recipeMap = recipeDoc.data();
//         final recipe = Recipe.fromMap(recipeMap);
//         _recipes.add(recipe);
//       }
//
//       notifyListeners(); // Notify listeners of data change
//     } catch (error) {
//       // Handle errors appropriately
//       print('Error fetching recipes: $error');
//       // Consider providing user feedback or retrying logic
//     }
//   }
//
//   List<Recipe> getRecipesByCategory(String category) {
//     return recipes.where((recipe) => recipe.categories.contains(category)).toList();
//   }
// }
