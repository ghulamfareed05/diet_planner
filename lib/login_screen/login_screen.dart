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
        child:Stack(
          children: [
            const VideoPlayerWidget(videoPath: "assets/video/second.mp4"),
            Container(color: Colors.lightGreenAccent.withOpacity(0.2),),

            const Positioned(

              child: Body(),
            )
          ],
        ),
      ),
    );
  }
}
