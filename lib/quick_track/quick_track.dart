
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isVegetarian = false;
  bool isGlutenFree = false;

  void _storeUserData() async {
    // Get the current user ID
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // Prepare data for nutrient information
    final nutrientData = {
      'date': DateTime.now().toString(), // Store date as string
      'kcal': _kcal,
      'carbs': _carbs,
      'fat': _fat,
      'protein': _protein,
      'isVegetarian': isVegetarian,
      'isGlutenFree': isGlutenFree,
    };

    // Reference to the user's document
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    // Reference to a new document in the nutrient_data collection
    final nutrientDocRef = userRef.collection('nutrient_data').doc();

    // Add nutrient data to the database (assuming error handling exists)
    await nutrientDocRef.set(nutrientData);

    // Clear form fields (optional)
    _formKey.currentState!.reset();
    setState(() {
      _kcal = 0.0;
      _carbs = 0.0;
      _fat = 0.0;
      _protein = 0.0;
      isVegetarian = false;
      isGlutenFree = false;
    });

    print('Nutrient data saved successfully!');
  }



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
              _buildSwitch(
                label: 'Vegetarian',
                value: isVegetarian,
                onChanged: (value) {
                  setState(() {
                    isVegetarian = value;
                  });
                },
              ),
              _buildSwitch(
                label: 'Gluten-Free',
                value: isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                },
              ),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _storeUserData();
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
  Widget _buildSwitch({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

}
