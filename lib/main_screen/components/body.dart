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
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ColorfulCard(
                        title:
                            "Collect recipes from the web or create your own.",
                        cardColor: Colors.white,
                        buttonText: "Add Recipe",
                        imagePath: "assets/images/pic2.jpg"),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
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
              )
              // Expanded(
              //   child: SingleChildScrollView(
              //       child: MealItems()),
              // ),
            ],
          )),
    ));
  }
}
