import 'package:diet_planner/components/glass_card.dart';
import 'package:diet_planner/components/nutrition_circular_bar.dart';
import 'package:diet_planner/components/set_diet_card.dart';
import 'package:flutter/material.dart';

import '../../components/colorful_card.dart';
import '../../components/nutrition_progress_card.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),

                Text(
                  "Hello! Your Name",
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * 0.025,
                      color: Colors.white),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                NutritionCircularBar(
                    eatenValue: 10, burnedValue: 0, totalCalories: 2500),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                const NutritionProgressCard(
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
                SizedBox(
                  height: getProportionateScreenHeight(20),

                ),
                const GlassCard(),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SetDietCard(
                    imageUrl: "assets/images/breakfast/fast1.jpg",
                    title: "Breakfast",
                    subtitle:  "Set your breakfast diet",
                    icon: Icons.add,
                    onPressed: (){}),
                SetDietCard(
                    imageUrl: "assets/images/lunch/lunch3.jpg",
                    title: "Launch",
                    subtitle:  "Set your launch diet",
                    icon: Icons.add,
                    onPressed: (){}),
                SetDietCard(
                    imageUrl: "assets/images/dinner/dinner4.jpg",
                    title: "Dinner",
                    subtitle:  "Set your dinner diet",
                    icon: Icons.add,
                    onPressed: (){}),
                SetDietCard(
                    imageUrl: "assets/images/breakfast/fast5.jpg",
                    title: "Snack",
                    subtitle:  "Set your breakfast diet",
                    icon: Icons.add,
                    onPressed: (){}),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),

                // Expanded(
                //   child: SingleChildScrollView(
                //       child: MealItems()),
                // ),
              ],
            ),
          )),
    ));
  }
}
