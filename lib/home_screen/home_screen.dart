import 'package:diet_planner/constants.dart';
import 'package:diet_planner/home_screen/components/body.dart';
import 'package:diet_planner/home_screen/components/example.dart';
import 'package:diet_planner/main_screen/main_screen.dart';
import 'package:diet_planner/meal.dart';
import 'package:diet_planner/meal_screen/meal_example.dart';
import 'package:diet_planner/meal_screen/meal_screen.dart';
import 'package:diet_planner/quick_track/quick_track.dart';
import 'package:flutter/material.dart';

import '../goal_screen/goal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    MainScreen(), // Replace with your desired tabs
    MealScreen(),
    Example(),
    QuickTrack(),
    GoalScreen(),
    Meal(),    // Replace with your desired tabs
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,

        selectedItemColor: borderColor,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal,),
            label: 'Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal,),
            label: 'Meal',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, ),
            label: 'Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, ),
            label: 'Meal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, ),
            label: 'Favorites',
          ),
          // Add more BottomNavigationBarItems as needed
        ],
      ),
    );
  }

}
