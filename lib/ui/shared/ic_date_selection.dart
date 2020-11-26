import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:iCovid/core/constants.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';

class ICDateSelection extends StatefulWidget {
  final String text;

  const ICDateSelection({Key key, this.text}) : super(key: key);

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
    QuizViewmodel model = Provider.of<QuizViewmodel>(context);

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
                model.storeAnswers(_dateString);
                model.selectNext();
              }),
        ),
      ],
    );
  }
}
