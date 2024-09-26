import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../size_config.dart';

class BottomDialog extends StatefulWidget {
  final String title;
  final Function(String) onDataSelected; // Callback function

  const BottomDialog({
    super.key,
    required this.title, required this.onDataSelected,
  });

  @override
  State<BottomDialog> createState() => _BottomDialogState();
}

class _BottomDialogState extends State<BottomDialog> {
  String _selectedGender = "";
  double _heightValue = 0.0;
  String _selectedBirthDay = "Select Birth Day";
  String _selectedUnit = "cm"; // Default unit

  final List<String> _unitOptions = ["cm", "in", "ft"];

  void _onUnitSelected(String unit) {
    setState(() {
      _selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                      horizontal: getProportionateScreenWidth(20)),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if(widget.title=="Gender")
                  buildGenderSelection()
                 else if(widget.title=="Height")
                  buildHeightSelection()
                else if(widget.title=="Weight")
                  buildWeightSelection()
                else
                  buildBirthDaySelection(context),
            
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle cancel
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey,
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle confirm with selected gender
                        widget.onDataSelected(_selectedGender); // Pass selected data back

                        Navigator.pop(context); // Pass selected gender back
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildGenderSelection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Radio<String>(
                value: "Male",
                activeColor: Colors.green,
                groupValue: _selectedGender,
                onChanged: (value) => setState(() => _selectedGender = value!),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Radio<String>(
                value: "Female",
                activeColor: Colors.green,
                groupValue: _selectedGender,
                onChanged: (value) => setState(() => _selectedGender = value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget buildHeightSelection() {
    late final numbersWheel = WheelPickerController(
      itemCount: 100,
      initialIndex: 0,
    );
    late final numbersWheelPoints = WheelPickerController(
      itemCount: 9,
      initialIndex: 0,
    );

    const textStyle = TextStyle(fontSize: 20);

    Widget itemBuilder(BuildContext context, int index) {
      return Text(
        (index + 1).toString(), // Numbers from 1 to 200
        style: textStyle,
      );
    }

    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * 1.8, // Text height
      squeeze: 1.25,
      diameterRatio: 0.8,
      surroundingOpacity: 0.25,
      magnification: 1.2,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WheelPicker(
          builder: itemBuilder,
          controller: numbersWheel,
          looping: false,
          style: wheelStyle,
          selectedIndexColor: Colors.green,
          onIndexChanged: (index) {
            setState(() {
              _selectedGender = (index + 1).toString() + " cm";
            });
          },
        ),
        const SizedBox(width: 10),
        const Text(".",
          style: textStyle,),
        const SizedBox(width: 10),
        WheelPicker(builder:
            itemBuilder,
            controller: numbersWheelPoints,
            looping: false,
            style: wheelStyle,
            selectedIndexColor: Colors.green,
          onIndexChanged: (index) {
            setState(() {
              _selectedGender = (index + 1).toString() + " cm";
            });
        }

          ),
        const SizedBox(width: 15),
        DropdownButton<String>(
          value: _selectedUnit,
          items: _unitOptions.map((unit) => DropdownMenuItem(
            value: unit,
            child: Text(unit),
          )).toList(),
          onChanged: (value) {
            setState(() {
              _selectedUnit = value!;
            });
          },
        ),
      ],
    );
  }
  Widget buildWeightSelection() {
    late final weightWheel = WheelPickerController(
      itemCount: 100,
      initialIndex: 0,
    );
    late final weightWheelPoints = WheelPickerController(
      itemCount: 9,
      initialIndex: 0,
    );

    const textStyle = TextStyle(fontSize: 20);

    Widget itemBuilder(BuildContext context, int index) {
      return Text(
        "${32 + index}", // Numbers from 70.0 to 169.9
        style: textStyle,
      );
    }
    Widget itemBuilderForPoints(BuildContext context, int index) {
      return Text(
        "${1 + index}", // Numbers from 70.0 to 169.9
        style: textStyle,
      );
    }

    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * 1.5, // Text height
      squeeze: 1.25,
      diameterRatio: 0.8,
      surroundingOpacity: 0.28,
      magnification: 1.4,
      
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WheelPicker(
          builder: itemBuilder,
          controller: weightWheel,
          looping: false,
          style: wheelStyle,
          selectedIndexColor: Colors.green,
          onIndexChanged: (index) {
            setState(() {
              _selectedGender = (32.0 + index).toString() + " kg";
            });
          },


        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(".", style: textStyle,  ),
        SizedBox(width: getProportionateScreenWidth(10)),

        WheelPicker(
          builder: itemBuilderForPoints,
          controller: weightWheelPoints,
          looping: false,
          style: wheelStyle,
          selectedIndexColor: Colors.green,
          onIndexChanged: (index) {
            setState(() {
              _selectedGender = (32.0 + index).toString() + " kg";
            });
          },
        ),
        SizedBox(width: getProportionateScreenWidth(10)),

        Text("Kg", style: textStyle,  )
      ],
    );
  }
  Widget buildBirthDaySelection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedBirthDay,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime(1900),
          lastDay: DateTime.now(),

          calendarFormat: CalendarFormat.month,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedGender = selectedDay.toString().split(' ')[0];
            });
          },
        ),
      ],
    );
  }


}
