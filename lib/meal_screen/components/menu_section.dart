import 'package:diet_planner/firebase_utills.dart';
import 'package:diet_planner/meal_screen/components/recipe.dart';
import 'package:diet_planner/meal_screen/components/recipe_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../../size_config.dart';
import '../meal_example.dart';



class MealItems extends StatefulWidget {
  MealItems({
    super.key,
  });

  @override
  State<MealItems> createState() => _MealItemsState();
}

class _MealItemsState extends State<MealItems> {
  List<Recipe> breakfastRecipes = [];

  List<Map<String, dynamic>> lunchRecipes = [];

  List<Map<String, dynamic>> dinnerRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RecipeLoader(category: "breakfast"),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        const RecipeLoader(category: "lunch"),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        const RecipeLoader(category: "dinner"),
      ],
    );
  }
}

class RecipeLoader extends StatelessWidget {
  const RecipeLoader({super.key, required this.category});

  final String category;

  String getCategoryName(String category) {
    if (category == "breakfast") {
      return "Breakfast";
    } else if (category == "lunch") {
      return "Lunch-Friendly";
    } else {
      return "Dinner";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: getRecipes(), // Call the appropriate function to fetch recipes
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        } else {
          final recipes = getRecipesByCategory(category, snapshot.data!);
          return Column(
            children: [
              // Category title and "See all" button (same as before)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getCategoryName(category),
                    style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealPlannerScreen(
                              recipes: recipes,
                              category: getCategoryName(category),
                              imageUrl: "assets/images/app_bar2.jpg"),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(fontSize: 15.0, color: borderColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.25,
                child: ListView.builder(
                  // Replace with appropriate scroll direction and item count
                  scrollDirection: Axis.horizontal,
                  itemCount: recipes.length > 5 ? 5 : recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Stack(
                              children: [
                                Image.network(
                                  recipe.imageUrl,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 0,
                                  child: Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color: borderColor.withOpacity(0.8),
                                    ),
                                    // color: Colors.black.withOpacity(0.5),
                                    child: IconButton(
                                      icon: const Icon(Icons.add, size: 16),
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RecipeDetailScreen(
                                                        recipe: recipe)));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            recipe.name.length > 15
                                ? '${recipe.name.substring(0, 15)}...' // Display first 15 characters and add ellipsis
                                : recipe.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

// ... other functions (getRecipes, getRecipesByCategory, getCategoryName)
}

// class RecipeLoader extends StatelessWidget {
//  RecipeLoader({super.key , required this.category});
//   List<Recipe> recipes = [];
//   String category ;
//  List <Widget> imageSlider(List<Recipe> recipes){
//    return recipes
//        .map(
//          (recipe) =>
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 8.0),
//            child: Column(
//              children: [
//                ClipRRect(
//                  // Wrap each image with a ClipRRect widget
//                  borderRadius: BorderRadius.circular(15.0),
//                  child: Stack(
//                    // Create a Stack widget
//                    children: [
//                      // Add a list of children
//                      Image.network(
//                        recipe.imageUrl,
//                        fit: BoxFit.cover,
//                        height: 150,
//                        width: 150,
//                      ),
//                      Positioned(
//                        top: 5,
//                        right: 0,
//                        child: Container(
//                          width: 50,
//                          height: 30,
//                          decoration: BoxDecoration(
//                            borderRadius: const BorderRadius.only(
//                              bottomLeft: Radius.circular(20),
//                              topLeft: Radius.circular(20),
//
//                            ),
//                            color: borderColor.withOpacity(0.8),
//                          ),
//                          // color: Colors.black.withOpacity(0.5),
//                          child: IconButton(
//                            icon: const Icon(Icons.add,
//                              size: 16,
//                            ),
//                            color: Colors.white,
//                            onPressed: () {},
//                          ),
//                        ),
//                      ),
//
//                    ],
//                  ),
//
//                ),
//                SizedBox(
//                  height: getProportionateScreenHeight(5),
//                ),
//                Text(
//                  // Add a Text widget as a child of the Stack widget
//                  recipe.name.length > 15
//                      ? '${recipe.name.substring(0, 15)}...' // Display first 20 characters and add ellipsis
//                      : recipe.name,
//                  style: const TextStyle(
//                    color: Colors.black,
//
//                    fontSize: 15,
//                    fontWeight: FontWeight.bold,
//                    // Set the weight of the text
//                  ),
//                )
//              ],
//            ),
//          ),
//    )
//        .toList();
//  }
//
//   @override
//   Widget build(BuildContext context) {
//    String categoryName ="";
//    if (category == "breakfast") {
//      categoryName = "Breakfast";
//    } else if (category == "lunch") {
//      categoryName = "Lunch-Friendly";
//    } else {
//      categoryName = "Dinner";
//    }
//
//     return  Column(
//       children: [
//         Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//                Text(
//                  categoryName,
//                 style: const TextStyle(
//                   fontSize: 19.0,
//                   fontWeight: FontWeight.bold,
//                   color: kTextColor,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Add your button action here
//                 },
//                 child: const Text(
//                   'See all',
//                   style: TextStyle(
//                     fontSize: 15.0,
//                     color: borderColor,
//                   ),
//                 ),
//               ),
//             ]),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child:FutureBuilder(future: getBreakfastRecipes() , builder: (context, snapshot) {
//             if( snapshot.connectionState == ConnectionState.waiting){
//               return CircularProgressIndicator();
//             }
//             else if(snapshot.connectionState == ConnectionState.done){
//               recipes= getRecipesByCategory(category, snapshot.data as List<Recipe>);
//               // breakfastRecipes = snapshot.data as List<Recipe>;
//               return Row(
//                 children: imageSlider(recipes),
//               );
//             } else {
//               return Text("Error");
//             }
//           }),
//         ),
//       ],
//     );
//
//   }
// }
