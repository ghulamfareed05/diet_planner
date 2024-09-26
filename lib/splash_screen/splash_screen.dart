import 'package:diet_planner/start_screen/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../firebase_utills.dart';
import '../home_screen/home_screen.dart';
import '../size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfterDelay();
  }
  // Function to check if the user is logged in
  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // Function to handle navigation after delay
  void navigateAfterDelay() async {
    // Replace 4 seconds with your desired delay duration
    await Future.delayed(const Duration(seconds: 5));

    if (isUserLoggedIn()) {
      await getUserData(); // Assuming this is defined elsewhere
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VideoSplash()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);



    // Call the navigation function on widget creation

    return Scaffold(
      backgroundColor: Colors.white,
      body:
         Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/video/splash_ani.json',
                  width: SizeConfig.screenWidth * 0.8,
                  height: SizeConfig.screenHeight * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "Diet Planner App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
                   ),
         ),

    );
  }
}
