import 'package:diet_planner/components/glass_card.dart';
import 'package:diet_planner/components/nutrition_circular_bar.dart';
import 'package:diet_planner/components/set_diet_card.dart';
import 'package:diet_planner/dietary_goals/dietary_goals.dart';
import 'package:diet_planner/quick_track/quick_track.dart';
import 'package:diet_planner/user_singleton.dart';
import 'package:flutter/material.dart';

import '../../components/colorful_card.dart';
import '../../components/nutrition_progress_card.dart';
import '../../meal_plan/your_meal_plan.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataSingleton userData = UserDataSingleton();

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
                  "Hello! ${userData.fullName}",
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * 0.025,
                      color: Colors.white),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                ColorfulCard(title: 'Your Goal',
                    description: "Set your goal",
                    cardColor: Colors.white, buttonText: "Your Goals",
                    imagePath: "assets/images/pic2.jpg",
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DietaryGoals(),
                        ),
                      );
                    }),

                // const NutritionCircularBar(
                //     eatenValue: 10, burnedValue: 0, totalCalories: 2500),
                // SizedBox(
                //   height: getProportionateScreenHeight(25),
                // ),
                // const NutritionProgressCard(
                //   carbProgress: 0.2,
                //   proteinProgress: 0.3,
                //   fatProgress: 0.1,
                //   carbLabel: "Carbs",
                //   proteinLabel: "Protein",
                //   fatLabel: "Fat",
                //   carbObtainedGrams: 72,
                //   proteinObtainedGrams: 50,
                //   fatObtainedGrams: 20,
                //   carbTotalGrams: 300,
                //   proteinTotalGrams: 200,
                //   fatTotalGrams: 100,
                // ),
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
                    subtitle: "Set your breakfast diet",
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickTrack( category: "breakfast",)));

                    }),
                SetDietCard(
                    imageUrl: "assets/images/lunch/lunch3.jpg",
                    title: "Launch",
                    subtitle: "Set your launch diet",
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickTrack(category: "lunch",)));
                    }),
                SetDietCard(
                    imageUrl: "assets/images/dinner/dinner4.jpg",
                    title: "Dinner",
                    subtitle: "Set your dinner diet",
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickTrack(category: "dinner")));
                    }),
                SetDietCard(
                    imageUrl: "assets/images/breakfast/fast5.jpg",
                    title: "Snack",
                    subtitle: "Set your breakfast diet",
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuickTrack(category: "snack")));
                    }),
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
