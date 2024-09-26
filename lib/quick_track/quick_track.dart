import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickTrack extends StatefulWidget {
  QuickTrack(
      {super.key,
      required this.category,
      this.documentId = '',
      this.totalKcal = 0,
      this.totalCarbs = 0,
      this.totalFat = 0,
      this.totalProtein = 0,
      this.isGlutenFree = false,
      this.isVegetarian = false});
  String category;
  String documentId;
  int totalKcal = 0;
  int totalCarbs = 0;
  int totalFat = 0;
  int totalProtein = 0;
  bool isGlutenFree;
  bool isVegetarian;

  @override
  State<QuickTrack> createState() => _QuickTrackState();
}

class _QuickTrackState extends State<QuickTrack> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _kcalController = TextEditingController();
  TextEditingController _carbsController = TextEditingController();
  TextEditingController _fatController = TextEditingController();
  TextEditingController _proteinController = TextEditingController();

   double? _kcal;
   double ?_carbs;
   double? _fat;
   double? _protein;
   bool isVegetarian= false;
   bool isGlutenFree= false;

  @override
  void initState() {
    super.initState();
    // Initialize fields with values based on the documentId
    print("widget.documentId ${widget.documentId}");
    if(widget.documentId.isNotEmpty){
      print("widget.documentId innerrr ${widget.documentId}");
      initializeValue();
    }
  }
Future<void> initializeValue()async {
  _kcalController = TextEditingController(text: widget.totalKcal.toString());
  _carbsController = TextEditingController(text: widget.totalCarbs.toString());
  _fatController = TextEditingController(text: widget.totalFat.toString());
  _proteinController = TextEditingController(text: widget.totalProtein.toString());
  isVegetarian = widget.isVegetarian;
  isGlutenFree = widget.isGlutenFree;
}
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

    // Reference to a n
    // ew document in the nutrient_data collection
    if(widget.documentId.isNotEmpty){
      final nutrientDocRef = userRef.collection('nutrient_data_${widget.category}').doc(widget.documentId);
      await nutrientDocRef.update(nutrientData);}
    else{
    final nutrientDocRef =
        userRef.collection('nutrient_data_${widget.category}').doc();

    // Add nutrient data to the database (assuming error handling exists)
    await nutrientDocRef.set(nutrientData);}

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
  void dispose() {
    _kcalController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    super.dispose();
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
                controller: _kcalController,
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
                controller: _carbsController,
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
                controller: _fatController,
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
                controller: _proteinController,
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
