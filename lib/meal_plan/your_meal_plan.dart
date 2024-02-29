
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YourMealPlan extends StatefulWidget {
  const YourMealPlan({Key? key}) : super(key: key);

  @override
  _YourMealPlanState createState() => _YourMealPlanState();
}

class _YourMealPlanState extends State<YourMealPlan> {
  late List<Meal> _meals = [];

  @override
  void initState() {
    super.initState();
    // Load meals when the widget is initialized
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid;

      // Reference to the 'users' collection
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Reference to the document of the specific user based on UID
      DocumentReference userDoc = users.doc(uid);

      // Fetch the user document
      DocumentSnapshot userSnapshot = await userDoc.get();

      // Get the mealIds array
      List<String> mealIds = List<String>.from(userSnapshot['mealIds'] ?? []);

      // Fetch the corresponding recipes for each mealId
      List<Meal> meals = [];
      for (String mealId in mealIds) {
        // Fetch recipe details based on mealId (you need to implement this)
        Map<String, dynamic>? recipeDetails = await fetchRecipeDetails(mealId);

        if (recipeDetails != null) {
          meals.add(
            Meal(
              category: recipeDetails['category'],
              name: recipeDetails['name'],
              calories: recipeDetails['calories'],
              mealId: mealId,
              imageurl: recipeDetails['imageurl'],
              carbs: recipeDetails['carbs'],
              fat: recipeDetails['fat'],
              fiber: recipeDetails['fiber'],
            ),
          );
        }
      }

      setState(() {
        _meals = meals;
      });
    } catch (e) {
      print('Error loading meals: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchRecipeDetails(String mealId) async {
    try {
      DocumentSnapshot recipeSnapshot = await FirebaseFirestore.instance
          .collection('Recipes-1')
          .doc(mealId)
          .get();

      if (recipeSnapshot.exists) {
        return {
          'category': recipeSnapshot['category'],
          'name': recipeSnapshot['name'],
          'imageurl': recipeSnapshot['imageurl'],
          'carbs': recipeSnapshot['carbs'],
          'fat': recipeSnapshot['fat'],
          'fiber': recipeSnapshot['fiber'],
          'calories': recipeSnapshot['calories'],
        };
      }

      return null;
    } catch (e) {
      print('Error fetching recipe details: $e');
      return null;
    }
  }

  Future<void> _deleteMeal(String mealId) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid;

      // Reference to the 'users' collection
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Reference to the document of the specific user based on UID
      DocumentReference userDoc = users.doc(uid);

      // Update the 'mealIds' array field using arrayRemove
      await userDoc.update({
        'mealIds': FieldValue.arrayRemove([mealId]),
      });

      // Reload meals after deletion
      _loadMeals();

      print('Meal deleted successfully.');
    } catch (e) {
      print('Error deleting meal: $e');
    }
  }

  // Helper method to calculate the sum of a specific nutrient for all meals
  int _calculateNutrientSum(String nutrient) {
    return _meals.fold(0, (sum, meal) => sum + (meal.nutrientValues[nutrient] ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Meal Plan'),
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(meal.imageurl),
                      radius: 30.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.name,
                            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Fiber: ${meal.fiber}g',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            'Calories: ${meal.calories} kcal',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Delete the meal when the delete button is pressed
                        _deleteMeal(meal.mealId);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Expanded(
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total Nutrient Values:'),
                SizedBox(height: 8),
                Text('Total Fiber: ${_calculateNutrientSum('fiber')}g'),
                Text('Total Fat: ${_calculateNutrientSum('fat')}g'),
                Text('Total Carbs: ${_calculateNutrientSum('carbs')}g'),
                Text('Total Calories: ${_calculateNutrientSum('calories')}kcal'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Meal {
  final String name;
  final String imageurl;
  final String category;
  final int? carbs;
  final int? fat;
  final int? fiber;
  final int? calories;
  final String mealId;

  // Store nutrient values in a map for easy sum calculation
  Map<String, int?> get nutrientValues => {
    'carbs': carbs,
    'fat': fat,
    'fiber': fiber,
    'calories': calories,
  };

  const Meal({
    required this.name,
    required this.calories,
    required this.mealId,
    required this.imageurl,
    required this.carbs,
    required this.fat,
    required this.category,
    required this.fiber,
  });
}




















//
// import 'package:flutter/material.dart';
//
// class YourMealPlan extends StatefulWidget {
//   const YourMealPlan({super.key});
//
//   @override
//   State<YourMealPlan> createState() => _YourMealPlanState();
// }
//
// class _YourMealPlanState extends State<YourMealPlan> {
//   final List<Meal> _meals = [
//     Meal(
//       time: 'Breakfast',
//       name: 'Oatmeal with berries',
//       calories: 300,
//     ),
//     Meal(
//       time: 'Lunch',
//       name: 'Chicken salad sandwich',
//       calories: 450,
//     ),
//     Meal(
//       time: 'Dinner',
//       name: 'Salmon with roasted vegetables',
//       calories: 500,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meal Plan'),
//       ),
//       body: ListView.builder(
//         itemCount: _meals.length,
//         itemBuilder: (context, index) {
//           final meal = _meals[index];
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             meal.time,
//                             style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             meal.name,
//                             style: const TextStyle(fontSize: 16.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Text(
//                       '${meal.calories} kcal',
//                       style: const TextStyle(fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class Meal {
//   final String time;
//   final String name;
//   final int calories;
//
//   const Meal({
//     required this.time,
//     required this.name,
//     required this.calories,
//   });
// }
