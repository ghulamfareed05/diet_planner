
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class QuickTrack extends StatefulWidget {
  const QuickTrack({super.key});

  @override
  State<QuickTrack> createState() => _QuickTrackState();
}

class _QuickTrackState extends State<QuickTrack> {
  final _formKey = GlobalKey<FormState>();
  double _kcal = 0.0;
  double _carbs = 0.0;
  double _fat = 0.0;
  double _protein = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Nutrient Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(50)),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kcal',
                  hintText: 'Enter the number of calories',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.fireplace_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for Kcal.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _kcal = double.parse(value!);
                  });
                },
              ),
              SizedBox(height: getProportionateScreenHeight(50)),

              // Carbs input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Carbs (g)',
                  hintText: 'Enter the number of grams of carbs',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lunch_dining_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for Carbs.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _carbs = double.parse(value!);
                  });
                },
              ),
              SizedBox(height: getProportionateScreenHeight(50)),

              // Fat input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Fat (g)',
                  hintText: 'Enter the number of grams of fat',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.food_bank_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for Fat.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _fat = double.parse(value!);
                  });
                },
              ),
              SizedBox(height: getProportionateScreenHeight(50)),

              // Protein input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Protein (g)',
                  hintText: 'Enter the number of grams of protein',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.pause_circle),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value for Protein.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _protein = double.parse(value!);
                  });
                },
              ),
              SizedBox(height: getProportionateScreenHeight(50)),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Handle submitted data (e.g., navigate to a confirmation screen, store data)
                    print('Kcal: $_kcal, Carbs: $_carbs, Fat: $_fat, Protein: $_protein');
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
