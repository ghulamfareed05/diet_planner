import 'package:diet_planner/user_data_input/components/body.dart';
import 'package:diet_planner/user_data_input/user_data_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_screen/login_screen.dart';
import '../size_config.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(50),),
            Text("Your Profile", style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.025,
              color: Colors.black45,
            ),),

            Body(),
            Text(
              "You have been logged out",
              style: TextStyle(
                  fontSize: SizeConfig.screenHeight * 0.025,
                  color: Colors.white),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),
    ));
  }
}
