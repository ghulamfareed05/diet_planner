import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';


class ColorfulCard extends StatelessWidget {
  final String title;
  final String description;
  final Color cardColor;
  final String buttonText;
  final String imagePath;
  final VoidCallback onButtonPressed;


  const ColorfulCard({
    super.key,
    required this.title,
    required this.description,
    required this.cardColor,
    required this.buttonText,
    required this.imagePath,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 1, // Drop shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: cardColor,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Colorful Text on the left side
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * 0.025,
                      color: Colors.black38),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onButtonPressed,

                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ],
            ),
            // Image on the right side

            // Text button in the middle

            SizedBox(
              width: getProportionateScreenWidth(70),
            ),
            Image.asset(
              imagePath,
              width: SizeConfig.screenWidth * 0.2,
              height: SizeConfig.screenHeight * 0.1,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
