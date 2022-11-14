import 'package:flutter/material.dart';

import 'constants.dart';
import 'data_helper.dart';
import 'lesson_model.dart';

class MyTextFormField extends StatefulWidget {
  final Function textFormFieldData;
  final double selectedValue;
  final double selectedCredit;
  const MyTextFormField({Key? key, required this.textFormFieldData, required this.selectedValue, required this.selectedCredit})
      : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  String name = "";
  double letterValue = 0;
  double creditValue = 0;
  // var _formKey = GlobalKey<FormState>();
  // double selectedValue = 4;
  // double selectedCredit = 4;
  double average = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // textAlignVertical: TextAlignVertical.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: TextAlign.center,
        onSaved: (value) {
          name = value.toString();
          letterValue = widget.selectedValue;
          creditValue = widget.selectedCredit;
          var lesson = Lesson(
              name: name, letterValue: letterValue, creditValue: creditValue);

          DataHelper.allAddedLessons.add(lesson);
          // print("Added:  ${DataHelper.allAddedLessons}");
          average = DataHelper.calculateAverage();

          widget.textFormFieldData(name,letterValue,creditValue, average);
          setState(() {});
        },
        validator: (value) {
          if (value!.length == 0) {
            return "Enter a character";
          }
        },
        decoration: InputDecoration(
          // contentPadding:  EdgeInsets.all(5),
          hintText: "Enter a Lesson Name",
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.primaryColor.shade100.withOpacity(0.3),
        ),
      ),
    );
    ;
  }
}
