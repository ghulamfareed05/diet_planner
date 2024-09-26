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
        child:Stack(
          children: [
            const VideoPlayerWidget(videoPath: "assets/video/third.mp4"),
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
