import 'package:flutter/material.dart';
import 'package:iCovid/core/models/data_structure_models.dart';
import 'package:iCovid/ui/screens/quiz_screen/quiz_viewmodel.dart';
import 'package:iCovid/ui/screens/quiz_screen/widget_types_views/single_checkable_selection.dart';
import 'package:provider/provider.dart';

class ICOptionsArea extends StatelessWidget {
  final Question question;

  const ICOptionsArea({Key key, this.question}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Question question =
    //     Provider.of<QuizViewmodel>(context, listen: true).currentQuestion;

    switch (question.widgetType) {
      case "SingleCheckableSelection":
        return SingleCheckableSelection();
        break;
      default:
        return Container();
    }
  }
}
