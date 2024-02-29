import 'package:flutter/material.dart';

import '../components/video_player_widget.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print("user  "+ userType);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/pic1.jpg"), // Replace with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.lightGreenAccent.withOpacity(0.3),
            child: Body(),
          ),
        ),
      ),
    );
  }
}
