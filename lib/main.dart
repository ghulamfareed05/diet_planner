import 'package:diet_planner/provider/auth_provider.dart';
import 'package:diet_planner/provider/goal_provider.dart';
import 'package:diet_planner/provider/recipe_provider.dart';
import 'package:diet_planner/splash_screen/splash_screen.dart';
import 'package:diet_planner/start_screen/start_page.dart';
import 'package:diet_planner/theme.dart';
import 'package:diet_planner/utilities.dart';
import 'package:diet_planner/weight_track_screen/weight_track.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await hideStatusBar();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // i have to take mealid asa array and then get all id and put into recipe get all recipe and their data and sum all of them
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreen(),
    );
  }
}
