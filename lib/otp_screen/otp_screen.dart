import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
        // Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/pic2.jpg"), // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.lightGreenAccent.withOpacity(0.3),
                child: Body(verificationId: verificationId),
              ),
            ),
    );
  }
}
