import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class NutritionCircularBar extends StatelessWidget {
  const NutritionCircularBar(
      {super.key,
      required this.eatenValue,
      required this.burnedValue,
      required this.totalCalories,
        this.eatenColor = Colors.white, // Example customization
        this.burnedColor = Colors.white,
      });
  final int eatenValue; // Range: 0.0 (none eaten) to total calories
  final int burnedValue; // Range: 0.0 (none burned) to total calories
  final int totalCalories;
  final Color eatenColor; // Customize as needed
  final Color burnedColor; // Customize as needed

  @override
  Widget build(BuildContext context) {
    final double progress = eatenValue / totalCalories;

    return Container(
      padding: const EdgeInsets.all(16.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$eatenValue",
                  style:  TextStyle(
                      fontSize: getProportionateScreenHeight(13),
                  color: Colors.white),
                ),
                Text(
                  "EATEN",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                    color: eatenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
           SizedBox(width: getProportionateScreenWidth(20)),
          Stack(
            alignment: Alignment.center, // Center the text
            children: [
              SizedBox(
                width: SizeConfig.screenWidth*0.4,
                height: SizeConfig.screenHeight*0.2,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10.0,
                  color: eatenColor.withOpacity(0.7),
                  backgroundColor: Colors.grey.shade400.withOpacity(0.2), // Make background transparent
                ),
              ),
              Text(
                "$totalCalories", // Display the value
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.bold,
                  color: eatenColor,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(50),),
              Text(
                " \n \nKCAL LEFT", // Display the value
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.bold,
                  color: eatenColor,
                ),
              ),
            ],
          ),
           SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$burnedValue ",
                  style:  TextStyle(
                      fontSize: getProportionateScreenHeight(13),
                  color: Colors.white),
                ),
                Text(
                  "BURNED",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                    color: burnedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );  }
}
