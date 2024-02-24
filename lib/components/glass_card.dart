
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {
  const GlassCard({super.key});

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  final List<double> _waterValues = List.generate(8, (_) => 0.0);
  final String imagePath = "assets/images/glass1.jpg";

  void _toggleGlassFilled(int index) {
    setState(() {
      if (_waterValues[index] == 0.0) {
        _waterValues[index] = 0.25; // Add water when becoming selected
      } else {
        _waterValues[index] = 0.0; // Subtract water on re-click
      }
    });
  }

  double _calculateTotalWater() {
    return _waterValues.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Water Tracker",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${_calculateTotalWater()} L",
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            SizedBox(height: getProportionateScreenHeight(28)),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => _buildGlassImage(index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassImage(int index) {
    return InkWell(
      onTap: () => _toggleGlassFilled(index),
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Opacity(
          opacity: _waterValues[index] > 0.0 ? 1.0 : 0.3,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Widget _buildGlass(int index) {
  //   return InkWell(
  //     onTap: () => _toggleGlassFilled(index),
  //     child: Container(
  //       height: 80.0,
  //       width: 40.0,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         border: Border.all(
  //           color: Colors.blue,
  //           width: 2.0,
  //         ),
  //         color: _isGlassFilled[index] ? Colors.blue : Colors.transparent,
  //       ),
  //     ),
  //   );
  // }
}
// Wrap(
//   spacing: 10.0, // Add spacing between glasses
//   runSpacing: 10.0, // Add spacing between rows
//   children: List.generate(8, (index) => _buildGlass(index)),
// ),