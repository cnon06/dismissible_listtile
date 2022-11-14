import 'package:dynamic_calculate_average/constants.dart';
import 'package:dynamic_calculate_average/data_helper.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
 

  ShowAverage({Key? key, required this.average})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              
              "Lessons: ${DataHelper.allAddedLessons.length> 0 ? DataHelper.allAddedLessons.length.toString() : '0'}",
              textAlign: TextAlign.center,
              style: Constants.showAverageBodyStyle,
            ),
          ),
          Text(
            average > 0 ? average.toStringAsFixed(2) : "0",
            style: Constants.averageStyle,
          ),
          Text(
            "Average",
            style: Constants.showAverageBodyStyle,
          ),
        ],
      ),
    );
  }
}
