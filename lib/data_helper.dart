import 'package:flutter/material.dart';

import 'lesson_model.dart';

class DataHelper {
  static double calculateAverage() {
    double allNotes = 0;
    double allCredits = 0;

    allAddedLessons.forEach((element) {
      allNotes += element.creditValue * element.letterValue;
      allCredits += element.creditValue;
    });

    return allNotes / allCredits;
  }

  static List<Lesson> allAddedLessons = [];

  static final Map<String, double> _letters = {
    "AA": 4,
    "BA": 3.5,
    "BB": 3,
    "CB": 2.5,
    "CC": 2,
    "DC": 1.5,
    "DD": 1,
    "FD": 0.5,
    "FF": 0.0
  };

  static List<DropdownMenuItem<double>> allLettersOfLessons = _letters.keys
      .toList()
      .map((e) => DropdownMenuItem(
            child: Text(e),
            value: _letters[e],
          ))
      .toList();

  static List<DropdownMenuItem<double>> creditsOfAllLessons = List.generate(
      10,
      (index) => DropdownMenuItem(
            child: Text("${index + 1}"),
            value: (index + 1).toDouble(),
          ));
}
