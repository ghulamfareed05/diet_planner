import 'package:diet_planner/components/colorful_card.dart';
import 'package:diet_planner/meal_plan/your_meal_plan.dart';
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

import 'menu_section.dart';



class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ColorfulCard(
                        title: "Your Recipes",
                        description:"Select recipes create your meal plan.",
                        cardColor: Colors.white,
                        buttonText: "Your Meal Plan",
                        onButtonPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const YourMealPlan(),
                            ),
                          );
                        },
                        imagePath: "assets/images/pic2.jpg"),

                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),

                 TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),

              Expanded(
                child: SingleChildScrollView(
                    child: MealItems()),
              ),
            ],
          )),
    ));
  }
}


