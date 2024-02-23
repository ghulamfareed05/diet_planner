import 'package:diet_planner/main_screen/components/body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green, // Top 30%
              Colors.white, // Bottom 30%
            ],
            stops: [0.1, 2.0], // Adjust the stop values to control the transition point
          ),
          ),
        child: const Body(),

        ),

    );
  }
}
