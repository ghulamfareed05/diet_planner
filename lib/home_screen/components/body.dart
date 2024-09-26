
import 'package:diet_planner/home_screen/components/example.dart';
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Example(),
                ],
              ),
            ),
          ),
        ));
  }
}
