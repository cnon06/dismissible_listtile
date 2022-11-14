import 'package:flutter/material.dart';

import 'constants.dart';
import 'data_helper.dart';

class Credits extends StatefulWidget {
  final Function selectCredit;
  Credits({required this.selectCredit});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  double selectedCredit = 4;
  @override
  Widget build(BuildContext context) {
    print("Credits buildi tetiklendi.");
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
                value: selectedCredit,
                items: DataHelper.creditsOfAllLessons,
                onChanged: (value) {
                  selectedCredit = value!;
                  widget.selectCredit(selectedCredit);

                  setState(() {});
                }),
          ),
        ),
      ),
    );
  }
}
