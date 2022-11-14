import 'package:flutter/material.dart';

import 'constants.dart';
import 'data_helper.dart';

class Letters extends StatefulWidget {
  final Function selectValue;
  Letters({required this.selectValue});

  @override
  State<Letters> createState() => _LettersState();
}

class _LettersState extends State<Letters> {
  double selectedValue = 4;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          padding: Constants.dropDownPadding,
          decoration: BoxDecoration(
            color: Constants.primaryColor.shade100.withOpacity(0.3),
            borderRadius: Constants.borderRadius,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<double>(
                iconEnabledColor: Constants.primaryColor.shade200,
                value: selectedValue,
                items: DataHelper.allLettersOfLessons,
                onChanged: (value) {
                  selectedValue = value!;
                  widget.selectValue(selectedValue);

                  setState(() {});
                }),
          ),
        ),
      ),
    );
  }
}
