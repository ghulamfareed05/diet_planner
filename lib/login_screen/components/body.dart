import 'package:diet_planner/login_screen/components/login_form.dart';
import 'package:flutter/material.dart';

import '../../components/no_account_text.dart';
import '../../size_config.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(28)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight*0.04,
                  ),
                  Text("Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(28),
                        fontWeight: FontWeight.bold
                    ),),
                  SizedBox(
                    height: SizeConfig.screenHeight*0.01,
                  ),
                  const Text(
                    "Sign in with your email and password \nor continue with social media",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight*0.04,
                  ),
                  LoginForm(),
                  SizedBox(height: SizeConfig.screenHeight*0.04,),
                  NoAccountText()
                ],
              ),
            ),
          ),
        ));
  }
}
