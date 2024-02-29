

import 'package:diet_planner/start_screen/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase_utills.dart';
import '../home_screen/home_screen.dart';
import '../size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    bool isUserLoggedIn() {
      return FirebaseAuth.instance.currentUser != null;
    }
    Future.delayed(const Duration(seconds: 4), () async { // Delay for 3 seconds
      if (isUserLoggedIn()) {
        await getUserData();

        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())); // Replace with your route
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoSplash())); // Replace with your route
      }
    });
    return const Scaffold(
      backgroundColor: Colors.white,
          body: Center(

                // App logo or image (optional)

                // App name or slogan (optional)
              child:   Text(
                  "Diet Planner App",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

            ),
    );
  }
}