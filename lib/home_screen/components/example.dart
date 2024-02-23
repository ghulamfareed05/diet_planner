import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double calorieTarget = 2000;
  double carbohydrateRatio = 50;
  double proteinRatio = 25;
  double fatRatio = 25;
  bool isVegetarian = false;
  bool isGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dietary Goals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildNumericInput(
                label: 'Calorie Target',
                value: calorieTarget,
                onChanged: (value) {
                  setState(() {
                    calorieTarget = value;
                  });
                },
              ),
              SizedBox(height: 16),
              _buildPercentageInput(
                label: 'Carbohydrate Ratio',
                value: carbohydrateRatio,
                onChanged: (value) {
                  setState(() {
                    carbohydrateRatio = value;
                  });
                },
              ),
              _buildPercentageInput(
                label: 'Protein Ratio',
                value: proteinRatio,
                onChanged: (value) {
                  setState(() {
                    proteinRatio = value;
                  });
                },
              ),
              _buildPercentageInput(
                label: 'Fat Ratio',
                value: fatRatio,
                onChanged: (value) {
                  setState(() {
                    fatRatio = value;
                  });
                },
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // TODO: Save the dietary goals
                  _saveDietaryGoals();
                },
                child: Text('Save Goals'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumericInput({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.number,
          initialValue: value.toString(),
          onChanged: (newValue) {
            onChanged(double.tryParse(newValue) ?? 0);
          },
        ),
      ],
    );
  }

  Widget _buildPercentageInput({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                onChanged: onChanged,
                min: 0,
                max: 100,
                divisions: 100,
                label: '$value%',
              ),
            ),
            SizedBox(width: 16),
            Text('$value%'),
          ],
        ),
      ],
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

  void _saveDietaryGoals() {
    // TODO: Implement logic to save dietary goals
    print('Calorie Target: $calorieTarget');
    print('Carbohydrate Ratio: $carbohydrateRatio%');
    print('Protein Ratio: $proteinRatio%');
    print('Fat Ratio: $fatRatio%');
    print('Vegetarian: $isVegetarian');
    print('Gluten-Free: $isGlutenFree');
    // Add your logic to save these values to your data storage
  }
}