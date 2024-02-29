import 'package:diet_planner/login_screen/components/body.dart';
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

import '../components/video_player_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
                "assets/images/pic3.jpg"), // Replace with your image asset path
            fit: BoxFit.cover,
          )),
          child: Container(
            color: Colors.lightGreenAccent.withOpacity(0.3),
            child: const Body(),
          ),
        ),
      ),
    );
  }
}
