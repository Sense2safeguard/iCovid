import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:iCovid/core/constants.dart';
import 'package:intl/intl.dart';

class ICDateSelection extends StatefulWidget {
  final String text;
  final Function onChanged;

  const ICDateSelection({Key key, this.text, this.onChanged}) : super(key: key);

  @override
  _ICDateSelectionState createState() => _ICDateSelectionState();
}

class _ICDateSelectionState extends State<ICDateSelection> {
  String _dateString = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_dateString, style: kSelectedDateTextStyle),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 100,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(1990, 1, 1),
              onDateTimeChanged: (DateTime date) {
                DateFormat formatter = DateFormat('EEEE, d MMMM yyyy');
                setState(() {
                  _dateString = formatter.format(date);
                });
              }),
        ),
      ],
    );
  }
}
