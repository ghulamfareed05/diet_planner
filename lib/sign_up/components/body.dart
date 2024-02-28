import 'package:diet_planner/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';


class Body extends StatelessWidget{
   const Body({super.key, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight*0.04,),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),

                SizedBox(height: SizeConfig.screenHeight*0.04,),
                Text("Register Account",
                style: headingStyle,),
                const Text("Complete your details and create an account.",
                ),
                SizedBox(height: SizeConfig.screenWidth*0.08,),
                 const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),


              ],
            ),
          ),
        ),
      ),
    );
  }


}