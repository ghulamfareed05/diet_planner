import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class ColorfulCard extends StatelessWidget {
  final String title;
  final Color cardColor;
  final String buttonText;
  final String imagePath;

  const ColorfulCard({
    super.key,
    required this.title,
    required this.cardColor,
    required this.buttonText,
    required this.imagePath,
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
                  "Your Recipe",
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * 0.025,
                      color: Colors.black38),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your button action here
                  },
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
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
