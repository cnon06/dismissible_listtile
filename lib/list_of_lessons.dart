import 'package:dynamic_calculate_average/constants.dart';
import 'package:dynamic_calculate_average/data_helper.dart';
import 'package:flutter/material.dart';

import 'lesson_model.dart';

class ListOfLessons extends StatelessWidget {
  final Function onElementRemoved;

  ListOfLessons({required this.onElementRemoved});

  List<Lesson> lessons = DataHelper.allAddedLessons;

  @override
  Widget build(BuildContext context) {
    return lessons.length != 0
        ? ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                onDismissed: (value) {
                  onElementRemoved(index);
                  
                  // DataHelper.allAddedLessons.removeAt(index);
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Constants.primaryColor,
                      child: Text("${lessons[index].name[0]}"),
                    ),
                    title: Text("${lessons[index].name}"),
                    subtitle: Text(
                        "Credit: ${lessons[index].creditValue}, Note Value: ${lessons[index].letterValue}"),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
            child: Text(
              "Add A Lesson",
              style: Constants.headlineStyle,
            ),
          ));
  }
}
