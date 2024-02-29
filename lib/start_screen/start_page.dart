
import 'package:diet_planner/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../components/lite_button.dart';
import '../components/video_player_widget.dart';
import '../login_screen/login_screen.dart';
import '../size_config.dart';

class VideoSplash extends StatelessWidget {
  const VideoSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [

                LiteButton(
                  text: "Login",
                  press: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  LoginScreen()));
                  },
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                LiteButton(
                  text: "Register",
                  press: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
