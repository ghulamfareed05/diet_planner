import 'package:flutter/material.dart';

import '../dietary_goals/components/body.dart';

class DietaryGoals extends StatelessWidget {
  const DietaryGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Dietary Goals'),
      ),
      body: Body(),

    );
  }
}
