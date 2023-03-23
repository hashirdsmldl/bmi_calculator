import 'dart:math';

import 'package:bmi_calculator/age.dart';
import 'package:bmi_calculator/height.dart';
import 'package:bmi_calculator/weight.dart';
import 'package:flutter/material.dart';

import 'result.dart';
import 'gender.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _weight = 40;
  double _height = 160;
  bool _maleChecked = false;
  bool _femaleChecked = false;
  List<double> list = [10, 20, 30, 40, 50, 60, 46];
  double _age = 0;
  void getListItem(double item) {
    setState(() {
      _age = item;
    });
  }

  void handleCheckboxMaleChange(bool? isMale) {
    setState(() {
      _maleChecked = isMale!;
      _femaleChecked = false;
    });
  }

  void handleCheckboxFemaleChange(bool? isFemale) {
    setState(() {
      _femaleChecked = isFemale!;
      _maleChecked = false;
    });
  }

  void handleWeight(dynamic value) {
    setState(() {
      _weight = value;
    });
  }

  void handleHeight(dynamic value) {
    setState(() {
      _height = value;
    });
  }

  void calculateBMI() {
    if (_maleChecked || _femaleChecked) {
      double heightInMeters = _height / 100;
      double weightInKg = _weight;

      double bmi = 1.3 * weightInKg / pow(heightInMeters, 2.5);
      // Display the result in a dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 30,

            ),
            contentTextStyle:const TextStyle(
              color: Colors.black45,
              fontSize: 30,

            ),
            title: const Text('Your BMI'),
            content: Text(bmi.toStringAsFixed(1)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Display an error message if the gender is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF363450),
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Gender(
              maleChecked: _maleChecked,
              femaleChecked: _femaleChecked,
              onChangedFemale: handleCheckboxFemaleChange,
              onChangedMale: handleCheckboxMaleChange,
            ),
            Height(height: _height, onChanged: handleHeight),
            Weight(weight: _weight, onChanged: handleWeight),
            Age(ages: list, age: _age, onChanged: getListItem),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    calculateBMI();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .blueAccent, // sets the background color of the button
                ),
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), // the text that appears on the button
              ),
            )
          ],
        ),
      ),
    );
  }
}
