import 'package:flutter/material.dart';
import 'package:iCovid/ui/components/ic_checkable_selection.dart';

class SingleCheckedSelection extends StatefulWidget {
  @override
  _SingleCheckedSelectionState createState() => _SingleCheckedSelectionState();
}

class _SingleCheckedSelectionState extends State<SingleCheckedSelection> {
  List options = [
    {"text": "No"},
    {"text": "Yes"},
  ];

  // Single Checked Selection State
  int _selectedOption;

  void setSelectedRadio(int val) {
    setState(() {
      _selectedOption = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedOption = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < options.length; i++)
          ICCheckableSelection(
              label: options[i]["text"],
              value: i,
              groupValue: _selectedOption,
              onChanged: (int index) {
                setState(() {
                  _selectedOption = index;
                });
              }),
      ],
    );
  }
}
