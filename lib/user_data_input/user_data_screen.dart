

import 'package:diet_planner/user_data_input/components/body.dart';
import 'package:flutter/material.dart';


class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, // Top 30%
              Colors.green, // Bottom 30%
            ],
            stops: [0.1, 2.0], // Adjust the stop values to control the transition point
          ),
        ),
        child: const Body(),
      ),
    );
  }
}
