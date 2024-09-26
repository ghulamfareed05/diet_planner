import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String _username = "John Doe"; // Replace with actual username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Divider(),
            // Row for Gender
            buildInfoRow("Gender", "Male >"),
            // Row for Height
            buildInfoRow("Height", "165 cm >"),
            // Row for Weight
            buildInfoRow("Weight", "73.0 kg >"),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}
