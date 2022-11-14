import 'package:dynamic_calculate_average/constants.dart';
import 'package:dynamic_calculate_average/credits.dart';
import 'package:dynamic_calculate_average/data_helper.dart';

import 'package:dynamic_calculate_average/letters.dart';
import 'package:dynamic_calculate_average/list_of_lessons.dart';
import 'package:dynamic_calculate_average/my_textform_field.dart';
import 'package:dynamic_calculate_average/show_average.dart';
import 'package:flutter/material.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  String name = "";
  double letterValue = 0;
  double creditValue = 0;
  var _formKey = GlobalKey<FormState>();
  double selectedValue = 4;
  double selectedCredit = 4;
  double average = 0;

  @override
  Widget build(BuildContext context) {
    // print("calculate average buildi tetiklendi.");
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            Constants.headlineText,
            style: Constants.headlineStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 125,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 3, child: _buildForm()),
                  Expanded(
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: ShowAverage(
                          average: average,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListOfLessons(
                onElementRemoved: (index) {
                  setState(() {
                    DataHelper.allAddedLessons.removeAt(index);
                    average = DataHelper.calculateAverage();
                    // print("Removed:  ${DataHelper.allAddedLessons}");
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: MyTextFormField(
                textFormFieldData: (name, letterValue, creditValue, average) {
                  this.letterValue = letterValue;
                  this.name = name;
                  this.creditValue = creditValue;
                  this.average = average;
                  print(
                      "this.letterValue: ${this.letterValue}, this.name: ${this.name}, this.creditValue: ${this.creditValue}");
                  setState(() {});
                },
                selectedCredit: selectedCredit,
                selectedValue: selectedValue,
                //key: _formKey,
              ),
              // child: _buildTextFormField(),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Letters(
                    selectValue: (value) {
                      selectedValue = value;
                      setState(() {
                        
                      });
                    },
                  ),
                  // _buildLetters(),
                  Credits(selectCredit: (credit) {
                    selectedCredit = credit;
                    setState(() {
                      
                    });
                  }), //_buildCredits(),
                  IconButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                        // else {
                        //   print(
                        //       "validation: ${_formKey.currentState!.validate()}, Lesson Name: $name, Letter Value: $letterValue, Credit Value: $creditValue");
                        // }
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          ],
        ));
  }

 
}
