import 'package:diet_planner/constants.dart';
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

import 'components/recipe.dart';
import 'components/recipe_details.dart';

class MealPlannerScreen extends StatelessWidget {
  MealPlannerScreen(
      {super.key,
      required this.recipes,
      required this.category,
      required this.imageUrl});
  List<Recipe> recipes = [];
  String category;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Build a meal plan',
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            expandedHeight: SizeConfig.screenHeight * 0.28,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    imageUrl,
                    width: SizeConfig.screenWidth,// Replace with the actual image asset path
                    fit: BoxFit.cover,
                  ),
                  // Transparent overlay with customization options
                  Container(
                    decoration: BoxDecoration(
                      // Adjust color, gradient, or image for the overlay
                      color: Colors.green.withOpacity(0.3), // Default color with opacity

                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Collect recipes from the web or create your own.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final recipe = recipes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the recipe details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.5), // Add your desired color
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              child: Image.network(
                                recipe.imageUrl,
                                height: SizeConfig.screenHeight * 0.21,
                                width: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.name.length > 10
                                    ? '${recipe.name.substring(0, 10)}...' // Display first 15 characters and add ellipsis
                                    : recipe.name,
                                style:  TextStyle(
                                  fontSize: getProportionateScreenHeight(18),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: recipes.length,
            ),
          ),
        ],
      ),
    );
  }
}
