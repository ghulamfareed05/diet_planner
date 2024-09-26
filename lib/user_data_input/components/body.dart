import 'package:diet_planner/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/bottom_dialog.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _selectedGender = "Select Gender";
  String _selectedHeight = "Select Height";
  String _selectedWeight = "Select Weight";
  String _selectedBirthDay = "Select BirthDay";

  void _onDataSelected(String label, String data) {
    setState(() {
      switch (label) {
        case "Gender":
          _selectedGender = data;
          break;
        case "Height":
          _selectedHeight = data;
          break;
        case "Weight":
          _selectedWeight = data;
          break;
        case "BirthDay":
          _selectedBirthDay = data;
          break;
      }
    });
  }

  void _onGenderSelected(String label) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BottomDialog(
                      title: label,
                      onDataSelected: (selectedData) => _onDataSelected(
                          label, selectedData)), // Updated callback
                  SizedBox(
                      height: getProportionateScreenHeight(
                          20)) // Your bottom dialog content goes here
                ],
              ),
            ),
          ),
        );
      },
    );

    // Handle cancelled dialog (no selection)
    if (result == null) {
      print("Dialog cancelled (no selection)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.12,
                    ),
                    buildInfoRow("Gender", _selectedGender),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    buildInfoRow("Height", _selectedHeight),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    buildInfoRow("Weight", _selectedWeight),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    buildInfoRow("BirthDay", _selectedBirthDay),
                  ],
                ))));
  }

  Widget buildInfoRow(String label, String value) {
    return GestureDetector(
      onTap: () {
        _onGenderSelected(label);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.black45, size: 18),
            ],
          )
        ],
      ),
    );
  }
}
