import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';


final List<String> imgList = [
  'assets/images/breakfast/fast1.jpg',
  'assets/images/breakfast/fast2.jpg',
  'assets/images/breakfast/fast3.jpg',
  'assets/images/breakfast/fast4.jpg',
];
class MealItems extends StatelessWidget {
  MealItems({
    super.key,
  });

  final List<Widget> imageSlider = imgList
      .map(
        (img) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            // Wrap each image with a ClipRRect widget
            borderRadius: BorderRadius.circular(15.0),
            child: Stack(
              // Create a Stack widget
              children: [
                // Add a list of children
                Image(
                  // Display the image
                  image: AssetImage(img),
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
                      icon: const Icon(Icons.add,
                        size  : 16,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),

              ],
            ),

          ),

          const Text(
            // Add a Text widget as a child of the Stack widget
            "data",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              // fontWeight: FontWeight.bold,
              // Set the weight of the text
            ),
          )
        ],
      ),
    ),
  )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Breakfast',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your button action here
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: borderColor,
                  ),
                ),
              ),
            ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageSlider,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lunch-Friendly',
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: kTextColor
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your button action here
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: borderColor,
                  ),
                ),
              ),
            ]),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageSlider,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dinner',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your button action here
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 15.0,
                    //underline

                    color: borderColor,
                  ),
                ),
              ),
            ]),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageSlider,
          ),
        ),
      ],
    );
  }
}
