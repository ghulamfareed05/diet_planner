import 'package:flutter/material.dart';

import '../../components/nutrition_circular_bar.dart';
import '../../components/nutrition_progress_card.dart';
import '../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [

              SizedBox(
                height: 20,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    // Content for Breakfast
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Breakfast Goal',
                            style: TextStyle(fontSize: 24),
                          ),
                          NutritionCircularBar(
                            eatenValue: 10,
                            burnedValue: 0,
                            totalCalories: 2500,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          NutritionProgressCard(
                            carbProgress: 0.2,
                            proteinProgress: 0.3,
                            fatProgress: 0.1,
                            carbLabel: "Carbs",
                            proteinLabel: "Protein",
                            fatLabel: "Fat",
                            carbObtainedGrams: 72,
                            proteinObtainedGrams: 50,
                            fatObtainedGrams: 20,
                            carbTotalGrams: 300,
                            proteinTotalGrams: 200,
                            fatTotalGrams: 100,
                          ),

                        ],
                      ),
                    ),
                    // Content for Lunch
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Lunch Goal',
                            style: TextStyle(fontSize: 24),
                          ),
                          NutritionCircularBar(
                            eatenValue: 10,
                            burnedValue: 0,
                            totalCalories: 2500,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          NutritionProgressCard(
                            carbProgress: 0.2,
                            proteinProgress: 0.3,
                            fatProgress: 0.1,
                            carbLabel: "Carbs",
                            proteinLabel: "Protein",
                            fatLabel: "Fat",
                            carbObtainedGrams: 72,
                            proteinObtainedGrams: 50,
                            fatObtainedGrams: 20,
                            carbTotalGrams: 300,
                            proteinTotalGrams: 200,
                            fatTotalGrams: 100,
                          ),

                        ],
                      ),
                    ),
                    // Content for Dinner
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Dinner Goal',
                            style: TextStyle(fontSize: 24),
                          ),
                          NutritionCircularBar(
                            eatenValue: 10,
                            burnedValue: 0,
                            totalCalories: 2500,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25),
                          ),
                          NutritionProgressCard(
                            carbProgress: 0.2,
                            proteinProgress: 0.3,
                            fatProgress: 0.1,
                            carbLabel: "Carbs",
                            proteinLabel: "Protein",
                            fatLabel: "Fat",
                            carbObtainedGrams: 72,
                            proteinObtainedGrams: 50,
                            fatObtainedGrams: 20,
                            carbTotalGrams: 300,
                            proteinTotalGrams: 200,
                            fatTotalGrams: 100,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

